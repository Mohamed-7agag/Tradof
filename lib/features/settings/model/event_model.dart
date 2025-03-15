class EventModel {
  final String id;
  final String title;
  final String description;
  final DateTime startTime;
  final DateTime endTime;

  EventModel({
    required this.id,
    required this.title,
    required this.description,
    required this.startTime,
    required this.endTime,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['_id'],
      title: json['title'],
      description: json['description'],
      startTime: DateTime.parse(json['startTime']),
      endTime: DateTime.parse(json['endTime']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'description': description,
      'startTime': startTime.toIso8601String(),
      'endTime': endTime.toIso8601String(),
    };
  }
}