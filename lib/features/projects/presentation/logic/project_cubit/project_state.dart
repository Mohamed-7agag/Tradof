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
  sendReviewLoading,
  sendReviewSuccess,
  sendReviewFailure,
  markAsFinishedLoading,
  markAsFinishedSuccess,
  markAsFinishedFailure,
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
