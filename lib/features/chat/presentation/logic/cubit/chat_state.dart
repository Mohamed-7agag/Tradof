part of 'chat_cubit.dart';

enum ChatStatus {
  initial,
  connecting,
  connected,
  disconnected,
  connectionError,
  error,
  loading,
  loaded,
}

extension ChatStatusX on ChatStatus {
  bool get isInitial => this == ChatStatus.initial;
  bool get isConnecting => this == ChatStatus.connecting;
  bool get isConnected => this == ChatStatus.connected;
  bool get isDisconnected => this == ChatStatus.disconnected;
  bool get isConnectionError => this == ChatStatus.connectionError;
  bool get isError => this == ChatStatus.error;
  bool get isLoading => this == ChatStatus.loading;
  bool get isLoaded => this == ChatStatus.loaded;
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
