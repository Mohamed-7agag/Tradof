class StatisticsProjectModel {
  final num active;
  final num inProgress;
  final num accepted;

  const StatisticsProjectModel({
    required this.active,
    required this.inProgress,
    required this.accepted,
  });

  factory StatisticsProjectModel.fromJson(Map<String, dynamic> json) {
    return StatisticsProjectModel(
      active: json['active'],
      inProgress: json['inProgress'],
      accepted: json['accepted'],
    );
  }
}
