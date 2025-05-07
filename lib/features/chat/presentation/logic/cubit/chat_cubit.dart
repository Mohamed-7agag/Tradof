import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/exception.dart';
import '../../../../../core/services/web_socket_service.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../data/model/chat_message_model.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final WebSocketService _webSocketService;
  late final StreamSubscription _statusSub;
  late final StreamSubscription _messageSub;
  late final StreamSubscription _historySub;

  String? _projectId;
  String? _freelancerId;
  String? _companyId;

  ChatCubit(this._webSocketService) : super(const ChatState()) {
    _statusSub = _webSocketService.statusStream.listen(_onStatusChanged);
    _messageSub = _webSocketService.messageStream.listen(_onMessageReceived);
    _historySub =
        _webSocketService.messagesHistoryStream.listen(_onHistoryReceived);
  }
  void setContext({
    required String projectId,
    required String freelancerId,
    required String companyId,
  }) {
    _projectId = projectId;
    _freelancerId = freelancerId;
    _companyId = companyId;
  }

  Future<void> connect() async {
    try {
      await _webSocketService.connect();
    } catch (e) {
      emit(state.copyWith(
        status: ChatStatus.error,
        errorMessage: ServerFailure.fromError(e).errMessage,
      ));
      log('connect e --------- : $e');
    }
  }

  Future<void> disconnect() async => _webSocketService.disconnect();

  Future<void> sendMessage(String content) async {
    if (_projectId == null || _freelancerId == null || _companyId == null) {
      emit(state.copyWith(
        status: ChatStatus.error,
        errorMessage:
            'Missing chat context. Set project, freelancer, and company IDs.',
      ));
      return;
    }

    final message = ChatMessageModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      senderId: AppConstants.kUserId,
      projectId: _projectId,
      freelancerId: _freelancerId,
      companyId: _companyId,
      message: content.trim(),
      timestamp: DateTime.now(),
    );

    final updatedMessages = [...state.messages, message];
    emit(state.copyWith(messages: updatedMessages));

    try {
      await _webSocketService.sendMessage(
        projectId: _projectId!,
        freelancerId: _freelancerId!,
        companyId: _companyId!,
        senderId: AppConstants.kUserId,
        message: content,
      );
    } catch (e) {
      emit(state.copyWith(
        status: ChatStatus.error,
        errorMessage: ServerFailure.fromError(e).errMessage,
      ));
      log('Send message e -------- : $e');
    }
  }

  Future<void> loadMessages() async {
    if (_projectId == null) {
      emit(state.copyWith(
        status: ChatStatus.error,
        errorMessage: 'Project ID is not set',
      ));
      return;
    }
    try {
      emit(state.copyWith(status: ChatStatus.loading));
      await _webSocketService.getMessages(
          projectId: _projectId!, userId: AppConstants.kUserId);
    } catch (e) {
      emit(state.copyWith(
        status: ChatStatus.error,
        errorMessage: ServerFailure.fromError(e).errMessage,
      ));
      log('load messages e -------- : $e');
    }
  }

  void markMessageAsRead(String messageId) {
    final updated = state.messages.map((msg) {
      if (msg.id == messageId) return msg.copyWith(seen: true);
      return msg;
    }).toList();
    emit(state.copyWith(messages: updated));
  }

  void _onStatusChanged(ChatStatus status) {
    if (isClosed) return;
    emit(state.copyWith(status: status));
  }

  void _onMessageReceived(ChatMessageModel message) {
    if (isClosed) return;
    if (!state.messages.any((m) => m.id == message.id)) {
      emit(state.copyWith(messages: [...state.messages, message]));
    }
  }

  void _onHistoryReceived(List<ChatMessageModel> history) {
    if (isClosed) return;
    emit(state.copyWith(messages: history, status: ChatStatus.connected));
  }

  @override
  Future<void> close() {
    _statusSub.cancel();
    _messageSub.cancel();
    _historySub.cancel();
    _webSocketService.dispose();
    return super.close();
  }
}
