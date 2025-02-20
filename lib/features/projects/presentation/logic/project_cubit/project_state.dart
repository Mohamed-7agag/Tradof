part of 'project_cubit.dart';

enum ProjectStatus {
  initial,
  createProjectLoading,
  createProjectSuccess,
  createProjectFailure,
  getUpcomingProjectsLoading,
  getUpcomingProjectsSuccess,
  getUpcomingProjectsFailure,
  getStartedtProjectsLoading,
  getStartedtProjectsSuccess,
  getStartedtProjectsFailure,
  updateProjectLoading,
  updateProjectSuccess,
  updateProjectFailure,
  deleteProjectLoading,
  deleteProjectSuccess,
  deleteProjectFailure,
}

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
}

class ProjectState extends Equatable {

  const ProjectState({
    this.status = ProjectStatus.initial,
    this.message = '',
    this.errorMessage = '',
    this.fromLanguage,
    this.toLanguage,
    this.industryId,
    this.upcomingProjects = const [],
    this.startedProjects = const [],
  });
  final ProjectStatus status;
  final String message;
  final String errorMessage;
  final LanguageModel? fromLanguage;
  final LanguageModel? toLanguage;
  final int? industryId;
  final List<ProjectModel> upcomingProjects;
  final List<ProjectModel> startedProjects;

  ProjectState copyWith({
    ProjectStatus? status,
    String? message,
    String? errorMessage,
    LanguageModel? fromLanguage,
    LanguageModel? toLanguage,
    int? industryId,
    List<ProjectModel>? upcomingProjects,
    List<ProjectModel>? startedProjects,
  }) {
    return ProjectState(
      status: status ?? this.status,
      message: message ?? this.message,
      errorMessage: errorMessage ?? this.errorMessage,
      fromLanguage: fromLanguage ?? this.fromLanguage,
      toLanguage: toLanguage ?? this.toLanguage,
      industryId: industryId ?? this.industryId,
      upcomingProjects: upcomingProjects ?? this.upcomingProjects,
      startedProjects: startedProjects ?? this.startedProjects,
    );
  }

  @override
  List<Object?> get props => [
        status,
        message,
        errorMessage,
        fromLanguage,
        toLanguage,
        industryId,
        upcomingProjects,
        startedProjects,
      ];
}
