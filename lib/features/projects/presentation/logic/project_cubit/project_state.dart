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
  currentProjectsFailure,
  getCurrentProjectsStatisticsLoading,
  getCurrentProjectsStatisticsSuccess,
  getCurrentProjectsStatisticsFailure,
  payProjectLoading,
  payProjectSuccess,
  payProjectFailure,
  getPaymentStatusLoading,
  getPaymentStatusSuccess,
  getPaymentStatusFailure,
  giveRatingLoading,
  giveRatingSuccess,
  giveRatingFailure,
}

class ProjectState extends Equatable {
  final ProjectStatus status;
  final String message;
  final String errorMessage;
  final LanguageModel? fromLanguage;
  final LanguageModel? toLanguage;
  final ProjectStatisticsModel? statistics;
  final int? industryId;
  final List<ProjectModel> upcomingProjects;
  final List<ProjectModel> startedProjects;
  final List<ProjectModel> currentProjects;
  final List<ProjectModel> allProjects;
  final Pagination allProjectsPagination;
  final Pagination currentProjectsPagination;
  final Pagination upcomingProjectsPagination;
  final Pagination startedProjectsPagination;
  final PayProjectResponseModel? payProjectResponse;
  final bool paymentStatus;

  const ProjectState({
    this.status = ProjectStatus.initial,
    this.message = '',
    this.errorMessage = '',
    this.fromLanguage,
    this.toLanguage,
    this.industryId,
    this.statistics,
    this.upcomingProjects = const [],
    this.startedProjects = const [],
    this.allProjects = const [],
    this.currentProjects = const [],
    this.allProjectsPagination = const Pagination(),
    this.currentProjectsPagination = const Pagination(),
    this.upcomingProjectsPagination = const Pagination(),
    this.startedProjectsPagination = const Pagination(),
    this.payProjectResponse,
    this.paymentStatus = false,
  });

  ProjectState copyWith({
    ProjectStatus? status,
    String? message,
    String? errorMessage,
    LanguageModel? fromLanguage,
    LanguageModel? toLanguage,
    int? industryId,
    ProjectStatisticsModel? statistics,
    List<ProjectModel>? upcomingProjects,
    List<ProjectModel>? startedProjects,
    List<ProjectModel>? allProjects,
    List<ProjectModel>? currentProjects,
    Pagination? allProjectsPagination,
    Pagination? currentProjectsPagination,
    Pagination? upcomingProjectsPagination,
    Pagination? startedProjectsPagination,
    PayProjectResponseModel? payProjectResponse,
    bool? paymentStatus,
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
      statistics: statistics ?? this.statistics,
      allProjectsPagination:
          allProjectsPagination ?? this.allProjectsPagination,
      currentProjectsPagination:
          currentProjectsPagination ?? this.currentProjectsPagination,
      upcomingProjectsPagination:
          upcomingProjectsPagination ?? this.upcomingProjectsPagination,
      startedProjectsPagination:
          startedProjectsPagination ?? this.startedProjectsPagination,
      payProjectResponse: payProjectResponse ?? this.payProjectResponse,
      paymentStatus: paymentStatus ?? this.paymentStatus,
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
        statistics,
        allProjects,
        allProjectsPagination,
        currentProjectsPagination,
        upcomingProjectsPagination,
        startedProjectsPagination,
        payProjectResponse,
        paymentStatus,
      ];
}