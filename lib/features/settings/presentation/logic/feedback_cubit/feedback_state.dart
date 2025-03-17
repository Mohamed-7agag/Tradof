part of 'feedback_cubit.dart';

enum FeedbackStatus {
  initial,
  sendFeedbackLoading,
  sendFeedbackSuccess,
  sendFeedbackFailure,
  askQuestionLoading,
  askQuestionSuccess,
  askQuestionFailure,
}

extension FeedbackStatusX on FeedbackStatus {
  bool get isSendFeedbackLoading => this == FeedbackStatus.sendFeedbackLoading;
  bool get isSendFeedbackSuccess => this == FeedbackStatus.sendFeedbackSuccess;
  bool get isSendFeedbackFailure => this == FeedbackStatus.sendFeedbackFailure;
  bool get isAskQuestionLoading => this == FeedbackStatus.askQuestionLoading;
  bool get isAskQuestionSuccess => this == FeedbackStatus.askQuestionSuccess;
  bool get isAskQuestionFailure => this == FeedbackStatus.askQuestionFailure;
}

class FeedbackState extends Equatable {
  final FeedbackStatus status;
  final String message;
  final String errMessage;
  final String rate;

  const FeedbackState({
    this.status = FeedbackStatus.initial,
    this.message = '',
    this.errMessage = '',
    this.rate = 'Very Bad',
  });

  FeedbackState copyWith({
    FeedbackStatus? status,
    String? message,
    String? errMessage,
    String? rate,
  }) {
    return FeedbackState(
      status: status ?? this.status,
      message: message ?? this.message,
      errMessage: errMessage ?? this.errMessage,
      rate: rate ?? this.rate,
    );
  }

  @override
  List<Object> get props => [status, message, errMessage, rate];
}
