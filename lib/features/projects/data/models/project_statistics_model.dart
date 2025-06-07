class ProjectStatisticsModel {
  final int activeProjects;
  final int completedProjects;
  final int cancelledProjects;

  ProjectStatisticsModel({
    required this.activeProjects,
    required this.completedProjects,
    required this.cancelledProjects,
  });

  factory ProjectStatisticsModel.fromJson(Map<String, dynamic> json) {
    return ProjectStatisticsModel(
      activeProjects: json['active'],
      completedProjects: json['completed'],
      cancelledProjects: json['cancelled'],
    );
  }
}
