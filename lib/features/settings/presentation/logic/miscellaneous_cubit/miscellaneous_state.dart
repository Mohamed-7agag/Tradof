part of 'miscellaneous_cubit.dart';

enum MiscellaneousStatus {
  initial,
  sendFeedbackLoading,
  sendFeedbackSuccess,
  sendFeedbackFailure,
  askQuestionLoading,
  askQuestionSuccess,
  askQuestionFailure,
  sendTechnicalSupportLoading,
  sendTechnicalSupportSuccess,
  sendTechnicalSupportFailure,
  getTechnicalSupportMessagesLoading,
  getTechnicalSupportMessagesSuccess,
  getTechnicalSupportMessagesFailure,
}

extension FeedbackStatusX on MiscellaneousStatus {
  bool get isSendFeedbackLoading =>
      this == MiscellaneousStatus.sendFeedbackLoading;
  bool get isSendFeedbackSuccess =>
      this == MiscellaneousStatus.sendFeedbackSuccess;
  bool get isSendFeedbackFailure =>
      this == MiscellaneousStatus.sendFeedbackFailure;
  bool get isAskQuestionLoading =>
      this == MiscellaneousStatus.askQuestionLoading;
  bool get isAskQuestionSuccess =>
      this == MiscellaneousStatus.askQuestionSuccess;
  bool get isAskQuestionFailure =>
      this == MiscellaneousStatus.askQuestionFailure;
  bool get isSendTechnicalSupportLoading =>
      this == MiscellaneousStatus.sendTechnicalSupportLoading;
  bool get isSendTechnicalSupportSuccess =>
      this == MiscellaneousStatus.sendTechnicalSupportSuccess;
  bool get isSendTechnicalSupportFailure =>
      this == MiscellaneousStatus.sendTechnicalSupportFailure;
  bool get isGetTechnicalSupportMessagesLoading =>
      this == MiscellaneousStatus.getTechnicalSupportMessagesLoading;
  bool get isGetTechnicalSupportMessagesSuccess =>
      this == MiscellaneousStatus.getTechnicalSupportMessagesSuccess;
  bool get isGetTechnicalSupportMessagesFailure =>
      this == MiscellaneousStatus.getTechnicalSupportMessagesFailure;
}

class MiscellaneousState extends Equatable {
  final MiscellaneousStatus status;
  final String message;
  final String errMessage;
  final String rate;
  final List<TechnicalSupportMessageModel> technicalSupportMessages;

  const MiscellaneousState({
    this.status = MiscellaneousStatus.initial,
    this.message = '',
    this.errMessage = '',
    this.rate = 'Very Bad',
    this.technicalSupportMessages = const [],
  });

  MiscellaneousState copyWith({
    MiscellaneousStatus? status,
    String? message,
    String? errMessage,
    String? rate,
    List<TechnicalSupportMessageModel>? technicalSupportMessages,
  }) {
    return MiscellaneousState(
        status: status ?? this.status,
        message: message ?? this.message,
        errMessage: errMessage ?? this.errMessage,
        rate: rate ?? this.rate,
        technicalSupportMessages:
            technicalSupportMessages ?? this.technicalSupportMessages);
  }

  @override
  List<Object> get props => [
        status,
        message,
        errMessage,
        rate,
        technicalSupportMessages,
      ];
}
