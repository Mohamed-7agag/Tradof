class NotificationSettingModel {
  final int sendEmail;
  final int alertOffers;
  final int messageChat;

  const NotificationSettingModel({
    required this.sendEmail,
    required this.alertOffers,
    required this.messageChat,
  });

  factory NotificationSettingModel.fromJson(Map<String, dynamic> json) {
    return NotificationSettingModel(
      sendEmail: json['sendEmail'] as int,
      alertOffers: json['alertOffers'] as int,
      messageChat: json['messageChat'] as int,
    );
  }

  Map<String, dynamic> toJson() => {
        'sendEmail': sendEmail,
        'alertOffers': alertOffers,
        'messageChat': messageChat,
      };
}