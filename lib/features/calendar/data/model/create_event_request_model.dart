class EventRequestModel {
  final String title;
  final String description;
  final DateTime startTime;
  final DateTime endTime;

  EventRequestModel({
    required this.title,
    required this.description,
    required this.startTime,
    required this.endTime,
  });

  Map<String, dynamic> toJson() => <String, dynamic>{
        'title': title,
        'description': description,
        'startTime': startTime.toIso8601String(),
        'endTime': endTime.toIso8601String(),
      };
}
