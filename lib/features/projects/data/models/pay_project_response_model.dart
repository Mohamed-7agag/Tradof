class PayProjectResponseModel {
  final bool success;
  final String message;
  final String type;
  final String iframURL;

  PayProjectResponseModel({
    required this.success,
    required this.message,
    required this.type,
    required this.iframURL,
  });

  factory PayProjectResponseModel.fromJson(Map<String, dynamic> json) {
    return PayProjectResponseModel(
      success: json['success'],
      message: json['message'],
      type: json['type'],
      iframURL: json['iframURL'],
    );
  }
}