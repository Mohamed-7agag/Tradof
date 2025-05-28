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
  updateNotificationSettingLoading,
  updateNotificationSettingSuccess,
  updateNotificationSettingFailure,
  getNotificationSettingLoading,
  getNotificationSettingSuccess,
  getNotificationSettingFailure,
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
  bool get isUpdateNotificationSettingLoading =>
      this == MiscellaneousStatus.updateNotificationSettingLoading;
  bool get isUpdateNotificationSettingSuccess =>
      this == MiscellaneousStatus.updateNotificationSettingSuccess;
  bool get isUpdateNotificationSettingFailure =>
      this == MiscellaneousStatus.updateNotificationSettingFailure;
      bool get isGetNotificationSettingLoading =>
        this == MiscellaneousStatus.getNotificationSettingLoading;
      bool get isGetNotificationSettingSuccess =>
        this == MiscellaneousStatus.getNotificationSettingSuccess;
      bool get isGetNotificationSettingFailure =>
        this == MiscellaneousStatus.getNotificationSettingFailure;
}

class MiscellaneousState extends Equatable {
  final MiscellaneousStatus status;
  final String message;
  final String errMessage;
  final String rate;
  final NotificationSettingModel? notificationSettingModel;
  final SubscriptionModel? subscriptionModel;
  final List<TechnicalSupportMessageModel> technicalSupportMessages;

  const MiscellaneousState({
    this.status = MiscellaneousStatus.initial,
    this.message = '',
    this.errMessage = '',
    this.rate = 'Very Bad',
    this.subscriptionModel,
    this.notificationSettingModel,
    this.technicalSupportMessages = const [],
  });

  MiscellaneousState copyWith({
    MiscellaneousStatus? status,
    String? message,
    String? errMessage,
    String? rate,
    NotificationSettingModel? notificationSettingModel,
    SubscriptionModel? subscriptionModel,
    List<TechnicalSupportMessageModel>? technicalSupportMessages,
  }) {
    return MiscellaneousState(
        status: status ?? this.status,
        message: message ?? this.message,
        errMessage: errMessage ?? this.errMessage,
        rate: rate ?? this.rate,
        subscriptionModel: subscriptionModel ?? this.subscriptionModel,
        notificationSettingModel:
            notificationSettingModel ?? this.notificationSettingModel,
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
