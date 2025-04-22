class MessageModel {
  final String message;
  final String senderId;
  final DateTime timestamp;
  final bool seen;

  MessageModel({
    required this.message,
    required this.senderId,
    required this.timestamp,
    this.seen = false,
  });
  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      message: json['message'] as String,
      senderId: json['senderId'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      seen: json['seen'] as bool? ?? false,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'senderId': senderId,
      'timestamp': timestamp.toIso8601String(),
      'seen': seen,
    };
  }
}