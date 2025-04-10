import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/services/chat_service.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final String websocketUrl;
  late ChatService _chatService;
  StreamSubscription<String>? _messageSubscription;

  ChatCubit({required this.websocketUrl}) : super(const ChatState()) {
    _initialize();
  }

  Future<void> _initialize() async {
    try {
      emit(state.copyWith(status: ChatStatus.connecting));

      _chatService = ChatService.connect(websocketUrl);

      _messageSubscription = _chatService.messageStream.listen(
        (message) {
          final updatedMessages = List<String>.from(state.messages)
            ..add(message);
          emit(state.copyWith(
            messages: updatedMessages,
            status: ChatStatus.connected,
          ));
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
      _chatService.sendMessage(message);
      // Message will be added when received back from server
      // Alternatively, you could add it immediately here with:
      // final updatedMessages = List<String>.from(state.messages)..add(message);
      // emit(state.copyWith(messages: updatedMessages));
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
