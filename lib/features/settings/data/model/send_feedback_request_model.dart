class SendFeedbackRequestModel {
  final String userId;
  final String rate;
  final String reasonRate;

  SendFeedbackRequestModel({
    required this.userId,
    required this.rate,
    required this.reasonRate,
  });

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'rate': rate,
        'reasonRate': reasonRate,
      };
}
