part of 'chat_cubit.dart';

enum ChatStatus {
  initial,
  connecting,
  connected,
  disconnected,
  error,
}

class ChatState extends Equatable {
  final ChatStatus status;
  final List<MessageModel> messages;
  final String? error;

  const ChatState({
    this.status = ChatStatus.initial,
    this.messages = const [],
    this.error,
  });

  @override
  List<Object?> get props => [status, messages, error];

  ChatState copyWith({
    ChatStatus? status,
    List<MessageModel>? messages,
    String? error,
  }) {
    return ChatState(
      status: status ?? this.status,
      messages: messages ?? this.messages,
      error: error ?? this.error,
    );
  }
}