part of 'project_cubit.dart';

enum ProjectStatus {
  initial,
  createProjectLoading,
  createProjectSuccess,
  createProjectFailure,
  getUpcomingProjectsLoading,
  getUpcomingProjectsSuccess,
  getUpcomingProjectsFailure
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
}

class ProjectState extends Equatable {
  final ProjectStatus status;
  final String message;
  final String errorMessage;
  final LanguageModel? fromLanguage;
  final LanguageModel? toLanguage;
  final int? industryId;
  final List<ProjectModel> upcomingProjects;

  const ProjectState({
    this.status = ProjectStatus.initial,
    this.message = '',
    this.errorMessage = '',
    this.fromLanguage,
    this.toLanguage,
    this.industryId,
    this.upcomingProjects = const [],
  });

  ProjectState copyWith({
    ProjectStatus? status,
    String? message,
    String? errorMessage,
    LanguageModel? fromLanguage,
    LanguageModel? toLanguage,
    int? industryId,
    List<ProjectModel>? upcomingProjects,
  }) {
    return ProjectState(
      status: status ?? this.status,
      message: message ?? this.message,
      errorMessage: errorMessage ?? this.errorMessage,
      fromLanguage: fromLanguage ?? this.fromLanguage,
      toLanguage: toLanguage ?? this.toLanguage,
      industryId: industryId ?? this.industryId,
      upcomingProjects: upcomingProjects ?? this.upcomingProjects,
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
      ];
}
