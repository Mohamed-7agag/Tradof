class TechnicalSupportMessageModel {
  final String senderId;
  final String message;
  final String? file;
  final String id;
  final DateTime timestamp;

  TechnicalSupportMessageModel({
    required this.senderId,
    required this.message,
    required this.id,
    required this.timestamp,
    this.file,
  });

  factory TechnicalSupportMessageModel.fromJson(Map<String, dynamic> json) {
    return TechnicalSupportMessageModel(
      senderId: json['senderId'],
      message: json['message'],
      file: json['file'],
      id: json['_id'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'senderId': senderId,
      'message': message,
      'file': file,
      '_id': id,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}
