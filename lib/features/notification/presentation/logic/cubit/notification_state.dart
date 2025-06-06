part of 'notification_cubit.dart';

enum NotificationStatus {
  connecting,
  connected,
  disconnected,
  connectionError,
  error,
  loading,
  loaded,
  markedAsSeenError,
  markedAsSeenSuccess,
}

extension NotificationStatusX on NotificationStatus {
  bool get isConnecting => this == NotificationStatus.connecting;
  bool get isConnected => this == NotificationStatus.connected;
  bool get isDisconnected => this == NotificationStatus.disconnected;
  bool get isConnectionError => this == NotificationStatus.connectionError;
  bool get isError => this == NotificationStatus.error;
  bool get isLoading => this == NotificationStatus.loading;
  bool get isLoaded => this == NotificationStatus.loaded;
  bool get isMarkedAsSeenError => this == NotificationStatus.markedAsSeenError;
  bool get isMarkedAsSeenSuccess => this == NotificationStatus.markedAsSeenSuccess;
}

class NotificationState extends Equatable{
  final NotificationStatus status;
  final List<NotificationModel> notifications;
  final String errorMessage;

  const NotificationState({
    this.status = NotificationStatus.connecting,
    this.notifications = const [],
    this.errorMessage = '',
  });

  NotificationState copyWith({
    NotificationStatus? status,
    List<NotificationModel>? notifications,
    String? errorMessage,
  }) {
    return NotificationState(
      status: status ?? this.status,
      notifications: notifications ?? this.notifications,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
  @override
  List<Object?> get props => [status, notifications, errorMessage];
}
