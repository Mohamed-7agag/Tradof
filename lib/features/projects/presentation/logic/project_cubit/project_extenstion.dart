import 'project_cubit.dart';

extension ProjectStatusX on ProjectStatus {
  bool get isCreateProjectLoading => this == ProjectStatus.createProjectLoading;
  bool get isCreateProjectSuccess => this == ProjectStatus.createProjectSuccess;
  bool get isCreateProjectFailure => this == ProjectStatus.createProjectFailure;

  bool get isGetUpcomingProjectsLoading =>
      this == ProjectStatus.getUpcomingProjectsLoading;
  bool get isGetUpcomingProjectsSuccess =>
      this == ProjectStatus.getUpcomingProjectsSuccess;
  bool get isGetUpcomingProjectsFailure =>
      this == ProjectStatus.getUpcomingProjectsFailure;

  bool get isGetStartedtProjectsLoading =>
      this == ProjectStatus.getStartedtProjectsLoading;
  bool get isGetStartedtProjectsSuccess =>
      this == ProjectStatus.getStartedtProjectsSuccess;
  bool get isGetStartedtProjectsFailure =>
      this == ProjectStatus.getStartedtProjectsFailure;

  bool get isUpdateProjectLoading => this == ProjectStatus.updateProjectLoading;
  bool get isUpdateProjectSuccess => this == ProjectStatus.updateProjectSuccess;
  bool get isUpdateProjectFailure => this == ProjectStatus.updateProjectFailure;

  bool get isDeleteProjectLoading => this == ProjectStatus.deleteProjectLoading;
  bool get isDeleteProjectSuccess => this == ProjectStatus.deleteProjectSuccess;
  bool get isDeleteProjectFailure => this == ProjectStatus.deleteProjectFailure;

  bool get isGetAllProjectsLoading =>
      this == ProjectStatus.getAllProjectsLoading;
  bool get isGetAllProjectsSuccess =>
      this == ProjectStatus.getAllProjectsSuccess;
  bool get isGetAllProjectsFailure =>
      this == ProjectStatus.getAllProjectsFailure;

  bool get isSendReviewLoading => this == ProjectStatus.sendReviewLoading;
  bool get isSendReviewSuccess => this == ProjectStatus.sendReviewSuccess;
  bool get isSendReviewFailure => this == ProjectStatus.sendReviewFailure;

  bool get isMarkAsFinishedLoading =>
      this == ProjectStatus.markAsFinishedLoading;
  bool get isMarkAsFinishedSuccess =>
      this == ProjectStatus.markAsFinishedSuccess;
  bool get isMarkAsFinishedFailure =>
      this == ProjectStatus.markAsFinishedFailure;
  bool get isCurrentProjectsLoading =>
      this == ProjectStatus.currentProjectsLoading;
  bool get isCurrentProjectsSuccess =>
      this == ProjectStatus.currentProjectsSuccess;
  bool get isCurrentProjectsFailure =>
      this == ProjectStatus.currentProjectsFailure;

  bool get isSetProjectStatus => this == ProjectStatus.setProjectStatus;
  bool get isGetStatisticsLoading => this == ProjectStatus.getStatisticsLoading;
  bool get isGetStatisticsSuccess => this == ProjectStatus.getStatisticsSuccess;
  bool get isGetStatisticsFailure => this == ProjectStatus.getStatisticsFailure;
}
