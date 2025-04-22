import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/services/chat_service.dart';
import '../../../data/model/message_model.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  late ChatService _chatService;
  StreamSubscription<Map<String, dynamic>>? _messageSubscription;
  final String projectId;
  final String freelancerId;
  final String companyId;

  ChatCubit({
    required this.projectId,
    required this.freelancerId,
    required this.companyId,
  }) : super(const ChatState()) {
    _initialize();
  }

  Future<void> _initialize() async {
    try {
      emit(state.copyWith(status: ChatStatus.connecting));

      _chatService = ChatService.connect(projectId);
      log('Connecting to chat service with projectId: $projectId');
      _messageSubscription = _chatService.messageStream.listen(
        (message) {
          if (message['event'] == 'message') {
            // Handle incoming message
            final newMessage = MessageModel.fromJson(message);
            final updatedMessages = List<MessageModel>.from(state.messages)
              ..add(newMessage);
            emit(state.copyWith(
              messages: updatedMessages,
              status: ChatStatus.connected,
            ));
            log('New message received: ${newMessage.message}');
          } else if (message['event'] == 'messages') {
            // Handle initial message list
            final messages =
                List<MessageModel>.from(message['data']['messages'] as List);
            emit(state.copyWith(
              messages: messages,
              status: ChatStatus.connected,
            ));
            log('Initial messages received: ${messages.length}');
          }
        },
        onError: (error) {
          emit(state.copyWith(
            status: ChatStatus.error,
            error: error.toString(),
          ));
        },
        onDone: () {
          emit(state.copyWith(status: ChatStatus.disconnected));
        },
      );

      // Request existing messages
      _chatService.requestMessages();

      emit(state.copyWith(status: ChatStatus.connected));
    } catch (e) {
      emit(state.copyWith(
        status: ChatStatus.error,
        error: 'Connection failed: ${e.toString()}',
      ));
    }
  }

  void sendMessage(String message) {
    if (state.status != ChatStatus.connected) {
      emit(state.copyWith(
        status: ChatStatus.error,
        error: 'Cannot send message - not connected',
      ));
      return;
    }

    try {
      _chatService.sendMessage(
        message: message,
        freelancerId: freelancerId,
        companyId: companyId,
      );
      log('Message sent: $message');
    } catch (e) {
      emit(state.copyWith(
        status: ChatStatus.error,
        error: 'Failed to send message: ${e.toString()}',
      ));
    }
  }

  @override
  Future<void> close() async {
    await _messageSubscription?.cancel();
    await _chatService.close();
    return super.close();
  }
}
