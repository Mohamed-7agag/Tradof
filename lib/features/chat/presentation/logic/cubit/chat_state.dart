part of 'chat_cubit.dart';

enum ChatStatus {
  initial,
  connecting,
  connected,
  disconnected,
  error,
  sending,
  sent,
  receiving,
  loading
}

class ChatState extends Equatable {
  final ChatStatus status;
  final List<ChatMessageModel> messages;
  final String errorMessage;

  const ChatState({
    this.status = ChatStatus.initial,
    this.messages = const [],
    this.errorMessage = '',
  });

  @override
  List<Object?> get props => [status, messages, errorMessage];

  ChatState copyWith({
    ChatStatus? status,
    List<ChatMessageModel>? messages,
    String? errorMessage,
  }) {
    return ChatState(
      status: status ?? this.status,
      messages: messages ?? this.messages,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
