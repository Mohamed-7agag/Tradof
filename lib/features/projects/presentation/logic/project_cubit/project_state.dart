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
  currentProjectsLoading,
  currentProjectsSuccess,
  currentProjectsFailure
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
  final List<ProjectModel> currentProjects;
  final List<ProjectModel> allProjects;
  final Pagination allProjectsPagination;
  final Pagination currentProjectsPagination;
  final Pagination upcomingProjectsPagination;
  final Pagination startedProjectsPagination;

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
    this.currentProjects = const [],
    this.allProjectsPagination = const Pagination(),
    this.currentProjectsPagination = const Pagination(),
    this.upcomingProjectsPagination = const Pagination(),
    this.startedProjectsPagination = const Pagination(),
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
    List<ProjectModel>? currentProjects,
    Pagination? allProjectsPagination,
    Pagination? currentProjectsPagination,
    Pagination? upcomingProjectsPagination,
    Pagination? startedProjectsPagination,
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
      currentProjects: currentProjects ?? this.currentProjects,
      allProjects: allProjects ?? this.allProjects,
      allProjectsPagination:
          allProjectsPagination ?? this.allProjectsPagination,
      currentProjectsPagination:
          currentProjectsPagination ?? this.currentProjectsPagination,
      upcomingProjectsPagination:
          upcomingProjectsPagination ?? this.upcomingProjectsPagination,
      startedProjectsPagination:
          startedProjectsPagination ?? this.startedProjectsPagination,
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
        currentProjects,
        startedProjects,
        allProjects,
        allProjectsPagination,
        currentProjectsPagination,
        upcomingProjectsPagination,
        startedProjectsPagination,
      ];
}
