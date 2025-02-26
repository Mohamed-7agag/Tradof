part of 'project_cubit.dart';

enum ProjectStatus {
  initial,
  createProjectLoading,
  createProjectSuccess,
  createProjectFailure,
  getUpcomingProjectsLoading,
  getUpcomingProjectsSuccess,
  getUpcomingProjectsFailure,
  getAllProjectsLoading,
  getAllProjectsSuccess,
  getAllProjectsFailure,
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

  bool get isGetAllProjectsLoading =>
      this == ProjectStatus.getAllProjectsLoading;
  bool get isGetAllProjectsSuccess =>
      this == ProjectStatus.getAllProjectsSuccess;
  bool get isGetAllProjectsFailure =>
      this == ProjectStatus.getAllProjectsFailure;
}

class ProjectState extends Equatable {
  final ProjectStatus status;
  final String message;
  final String errorMessage;
  final LanguageModel? fromLanguage;
  final LanguageModel? toLanguage;
  final int? industryId;
  final List<ProjectModel> upcomingProjects;
  final List<ProjectModel> startedProjects;
  final List<ProjectModel> allProjects;
  final int pageIndex;
  final int pageSize;
  final int count;
  final bool hasReachedMax;

  const ProjectState({
    this.status = ProjectStatus.initial,
    this.message = '',
    this.errorMessage = '',
    this.fromLanguage,
    this.toLanguage,
    this.industryId,
    this.upcomingProjects = const [],
    this.startedProjects = const [],
    this.allProjects = const [],
    this.pageIndex = 1,
    this.pageSize = 8,
    this.count = 0,
    this.hasReachedMax = false,
  });

  ProjectState copyWith({
    ProjectStatus? status,
    String? message,
    String? errorMessage,
    LanguageModel? fromLanguage,
    LanguageModel? toLanguage,
    int? industryId,
    List<ProjectModel>? upcomingProjects,
    List<ProjectModel>? startedProjects,
    List<ProjectModel>? allProjects,
    int? pageIndex,
    int? pageSize,
    int? count,
    bool? hasReachedMax,
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
      allProjects: allProjects ?? this.allProjects,
      pageIndex: pageIndex ?? this.pageIndex,
      pageSize: pageSize ?? this.pageSize,
      count: count ?? this.count,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
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
        allProjects,
        pageIndex,
        pageSize,
        count,
        hasReachedMax
      ];
}
