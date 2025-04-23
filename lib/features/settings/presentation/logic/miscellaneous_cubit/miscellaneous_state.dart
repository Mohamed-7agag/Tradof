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
  getSubscriptionLoading,
  getSubscriptionSuccess,
  getSubscriptionFailure,
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
  bool get isGetSubscriptionPlanLoading =>
      this == MiscellaneousStatus.getSubscriptionLoading;
  bool get isGetSubscriptionPlanSuccess =>    
      this == MiscellaneousStatus.getSubscriptionSuccess;
  bool get isGetSubscriptionPlanFailure =>
      this == MiscellaneousStatus.getSubscriptionFailure;
}

class MiscellaneousState extends Equatable {
  final MiscellaneousStatus status;
  final String message;
  final String errMessage;
  final String rate;
  final SubscriptionModel? subscriptionModel;
  final List<TechnicalSupportMessageModel> technicalSupportMessages;

  const MiscellaneousState({
    this.status = MiscellaneousStatus.initial,
    this.message = '',
    this.errMessage = '',
    this.rate = 'Very Bad',
    this.subscriptionModel,
    this.technicalSupportMessages = const [],
  });

  MiscellaneousState copyWith({
    MiscellaneousStatus? status,
    String? message,
    String? errMessage,
    String? rate,
    SubscriptionModel? subscriptionModel,
    List<TechnicalSupportMessageModel>? technicalSupportMessages,
  }) {
    return MiscellaneousState(
        status: status ?? this.status,
        message: message ?? this.message,
        errMessage: errMessage ?? this.errMessage,
        rate: rate ?? this.rate,
        subscriptionModel: subscriptionModel ?? this.subscriptionModel,
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
