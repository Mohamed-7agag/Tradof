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
  StreamSubscription? _messageSub;
  StreamSubscription? _messagesListSub;
  StreamSubscription? _connectionSub;
  StreamSubscription? _errorSub;

  int? _projectId;
  String? _freelancerId;
  String? _companyId;

  ChatCubit(this._webSocketService) : super(const ChatState());

  Future<void> initializeChat({
    required int projectId,
    required String freelancerId,
    required String companyId,
  }) async {
    _projectId = projectId;
    _freelancerId = freelancerId;
    _companyId = companyId;

    await _connectAndListen();
    if (!_webSocketService.isConnected) {
      await _webSocketService.connectionStream
          .firstWhere((connected) => connected);
    }
    await loadMessages();
  }

  Future<void> _connectAndListen() async {
    emit(state.copyWith(status: ChatStatus.connecting));
    if (_webSocketService.isConnected) {
      emit(state.copyWith(status: ChatStatus.connected));
      return;
    }

    final completer = Completer<void>();
    StreamSubscription? tempSub;
    tempSub = _webSocketService.connectionStream.listen((connected) {
      if (connected) {
        completer.complete();
        tempSub?.cancel();
      }
    }, onError: (e) {
      completer.completeError(e);
      tempSub?.cancel();
    });

    await _webSocketService.connect();
    await completer.future;
    emit(state.copyWith(status: ChatStatus.connected));

    _connectionSub?.cancel();
    _messageSub?.cancel();
    _messagesListSub?.cancel();
    _errorSub?.cancel();

    _connectionSub = _webSocketService.connectionStream.listen((connected) {
      emit(state.copyWith(
        status: connected ? ChatStatus.connected : ChatStatus.disconnected,
      ));
    });

    _messageSub = _webSocketService.messageStream.listen(_onMessageReceived);
    _messagesListSub = _webSocketService.messagesListStream.listen((messages) {
      emit(state.copyWith(messages: messages, status: ChatStatus.loaded));
    });

    _errorSub = _webSocketService.errorStream.listen((err) {
      emit(state.copyWith(
        status: ChatStatus.connectionError,
        errorMessage: err,
      ));
    });
  }

  Future<void> loadMessages() async {
    if (_projectId == null) {
      emit(state.copyWith(
        status: ChatStatus.error,
        errorMessage: 'Project ID is not set',
      ));
      return;
    }

    emit(state.copyWith(status: ChatStatus.loading));
    const maxRetries = 3;
    var retries = 0;

    while (retries < maxRetries) {
      if (_webSocketService.isConnected) {
        try {
          await _webSocketService.getMessages(
            projectId: _projectId!,
            userId: AppConstants.kUserId,
          );
          emit(state.copyWith(status: ChatStatus.loaded));
          return;
        } catch (e) {
          emit(state.copyWith(
            status: ChatStatus.error,
            errorMessage: _getErrorMessage(e),
          ));
          log('Load messages error: $e');
          return;
        }
      }
      retries++;
      await Future.delayed(const Duration(milliseconds: 500));
    }

    emit(state.copyWith(
      status: ChatStatus.error,
      errorMessage: 'Failed to connect to socket after $maxRetries attempts',
    ));
  }

  Future<void> sendMessage(String content) async {
    if (!_isContextValid()) {
      emit(state.copyWith(
        status: ChatStatus.error,
        errorMessage: 'Chat context not properly initialized',
      ));
      return;
    }
    if (content.trim().isEmpty) return;
    try {
      await _webSocketService.sendMessage(
        projectId: _projectId!,
        freelancerId: _freelancerId!,
        companyId: _companyId!,
        senderId: AppConstants.kUserId,
        message: content.trim(),
      );
    } catch (e) {
      emit(state.copyWith(
        status: ChatStatus.error,
        errorMessage: _getErrorMessage(e),
      ));
      log('Send message error: $e');
    }
  }

  void _onMessageReceived(ChatMessageModel message) {
    if (isClosed) return;
    final updatedMessages = [...state.messages, message];
    emit(state.copyWith(
      messages: updatedMessages,
      status: ChatStatus.loaded,
    ));
  }

  bool _isContextValid() {
    return _projectId != null && _freelancerId != null && _companyId != null;
  }

  String _getErrorMessage(dynamic error) {
    if (error is ServerFailure) {
      return error.errMessage;
    }
    return ServerFailure.fromError(error).errMessage;
  }

  Future<void> disconnect() async {
    _webSocketService.disconnect();
    emit(state.copyWith(status: ChatStatus.disconnected));
  }

  @override
  Future<void> close() {
    _messageSub?.cancel();
    _messagesListSub?.cancel();
    _connectionSub?.cancel();
    _errorSub?.cancel();
    _webSocketService.dispose();
    return super.close();
  }
}
