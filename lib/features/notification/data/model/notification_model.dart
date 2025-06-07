import 'package:equatable/equatable.dart';

class NotificationModel extends Equatable {
  final String id;
  final String message;
  final String type;
  final DateTime timestamp;
  final bool seen;
  final String receiverId;

  const NotificationModel({
    required this.id,
    required this.message,
    required this.type,
    required this.timestamp,
    required this.seen,
    required this.receiverId,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        id: json['_id'] as String,
        message: json['message'] as String,
        type: json['type'] as String,
        timestamp: DateTime.parse(json['timestamp'] as String),
        seen: json['seen'] as bool,
        receiverId: json['receiverId'] as String,
      );

      NotificationModel copyWith({
        String? id,
        String? message,
        String? type,
        DateTime? timestamp,
        bool? seen,
        String? receiverId,
      }) {
        return NotificationModel(
          id: id ?? this.id,
          message: message ?? this.message,
          type: type ?? this.type,
          timestamp: timestamp ?? this.timestamp,
          seen: seen ?? this.seen,
          receiverId: receiverId ?? this.receiverId,
        );
      }
  @override
  List<Object?> get props => [id, message, type, timestamp, seen, receiverId];
}
