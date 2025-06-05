class ProjectStatisticsModel {
  final int activeProjects;
  final int inProgressProjects;
  final int acceptedProjects;

  ProjectStatisticsModel({
    required this.activeProjects,
    required this.inProgressProjects,
    required this.acceptedProjects,
  });

  factory ProjectStatisticsModel.fromJson(Map<String, dynamic> json) {
    return ProjectStatisticsModel(
      activeProjects: json['active'],
      inProgressProjects: json['inProgress'],
      acceptedProjects: json['accepted'],
    );
  }
}
