class ChatMessageModel {
  final String? id;
  final String senderId;
  final String? projectId;
  final String? freelancerId;
  final String? companyId;
  final String message;
  final int timestamp;
  final bool seen;

  ChatMessageModel({
    required this.id,
    required this.senderId,
    required this.message,
    required this.timestamp,
    this.projectId,
    this.freelancerId,
    this.companyId,
    this.seen = false,
  });

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) {
    return ChatMessageModel(
      id: json['id'],
      senderId: json['senderId'],
      projectId: json['projectId'],
      freelancerId: json['freelancerId'],
      companyId: json['companyId'],
      message: json['message'],
      timestamp: json['timestamp'] ,
      seen: json['seen'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'senderId': senderId,
      'projectId': projectId,
      'freelancerId': freelancerId,
      'companyId': companyId,
      'message': message,
      'timestamp': timestamp,
      'seen': seen,
    };
  }

  ChatMessageModel copyWith({
    String? id,
    String? senderId,
    String? projectId,
    String? freelancerId,
    String? companyId,
    String? message,
    int? timestamp,
    bool? seen,
  }) {
    return ChatMessageModel(
      id: id ?? this.id,
      senderId: senderId ?? this.senderId,
      projectId: projectId ?? this.projectId,
      freelancerId: freelancerId ?? this.freelancerId,
      companyId: companyId ?? this.companyId,
      message: message ?? this.message,
      timestamp: timestamp ?? this.timestamp,
      seen: seen ?? this.seen,
    );
  }
}
