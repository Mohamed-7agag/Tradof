import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/exception.dart';
import '../../../../../core/helpers/extensions.dart';
import '../../../../../core/helpers/pagination_class.dart';
import '../../../../../core/helpers/prepare_files.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/models/language_model.dart';
import '../../../data/models/create_project_request_model.dart';
import '../../../data/models/project_model.dart';
import '../../../data/models/statistics_project_model.dart';
import '../../../data/repo/project_repo.dart';

part 'project_state.dart';

class ProjectCubit extends Cubit<ProjectState> {
  ProjectCubit(this._projectRepo) : super(const ProjectState());
  final ProjectRepo _projectRepo;

//! get upcoming projects
  Future<void> getUpcomingProjects({bool loadMore = false}) async {
    if (loadMore && state.upcomingProjectsPagination.hasReachedMax) return;

    final nextPageIndex =
        loadMore ? state.upcomingProjectsPagination.pageIndex + 1 : 1;

    emit(state.copyWith(status: ProjectStatus.getUpcomingProjectsLoading));

    try {
      final response = await _projectRepo.getUpcomingProjects(
        companyId: AppConstants.kUserId,
        pageIndex: nextPageIndex,
        pageSize: state.upcomingProjectsPagination.pageSize,
      );

      final newProjects = response.items;
      final hasReachedMax =
          newProjects.length < state.upcomingProjectsPagination.pageSize;

      emit(state.copyWith(
        status: ProjectStatus.getUpcomingProjectsSuccess,
        upcomingProjects: loadMore
            ? [...state.upcomingProjects, ...newProjects]
            : newProjects,
        upcomingProjectsPagination: state.upcomingProjectsPagination.copyWith(
          pageIndex: nextPageIndex,
          hasReachedMax: hasReachedMax,
          count: response.count,
        ),
      ));
    } catch (e) {
      emit(state.copyWith(
        status: ProjectStatus.getUpcomingProjectsFailure,
        errorMessage: ServerFailure.fromError(e).errMessage,
      ));
    }
  }

  //! get started projects
  Future<void> getStartedProjects({bool loadMore = false}) async {
    if (loadMore && state.startedProjectsPagination.hasReachedMax) return;

    final nextPageIndex =
        loadMore ? state.startedProjectsPagination.pageIndex + 1 : 1;

    emit(state.copyWith(status: ProjectStatus.getStartedtProjectsLoading));

    try {
      final response = await _projectRepo.getStartedProjects(
        pageIndex: nextPageIndex,
        pageSize: state.startedProjectsPagination.pageSize,
        companyId: AppConstants.kUserId,
      );

      final newProjects = response.items;
      final hasReachedMax =
          newProjects.length < state.startedProjectsPagination.pageSize;

      emit(state.copyWith(
        status: ProjectStatus.getStartedtProjectsSuccess,
        startedProjects:
            loadMore ? [...state.startedProjects, ...newProjects] : newProjects,
        startedProjectsPagination: state.startedProjectsPagination.copyWith(
          pageIndex: nextPageIndex,
          hasReachedMax: hasReachedMax,
          count: response.count,
        ),
      ));
    } catch (e) {
      emit(state.copyWith(
        status: ProjectStatus.getStartedtProjectsFailure,
        errorMessage: ServerFailure.fromError(e).errMessage,
      ));
    }
  }

  //! get all projects
  Future<void> getAllProjects({bool loadMore = false}) async {
    if (loadMore && state.allProjectsPagination.hasReachedMax) return;

    final nextPageIndex =
        loadMore ? state.allProjectsPagination.pageIndex + 1 : 1;

    emit(state.copyWith(status: ProjectStatus.getAllProjectsLoading));

    try {
      final response = await _projectRepo.getAllProjects(
        pageIndex: nextPageIndex,
        pageSize: state.allProjectsPagination.pageSize,
      );

      final newProjects = response.items;
      final hasReachedMax =
          newProjects.length < state.allProjectsPagination.pageSize;

      emit(state.copyWith(
        status: ProjectStatus.getAllProjectsSuccess,
        allProjects: loadMore
            ? [...state.upcomingProjects, ...newProjects]
            : newProjects,
        allProjectsPagination: state.allProjectsPagination.copyWith(
          pageIndex: nextPageIndex,
          hasReachedMax: hasReachedMax,
          count: response.count,
        ),
      ));
    } catch (e) {
      emit(state.copyWith(
        status: ProjectStatus.getAllProjectsFailure,
        errorMessage: ServerFailure.fromError(e).errMessage,
      ));
    }
  }

  //! get current projects
  Future<void> getCurrentProjects({bool loadMore = false}) async {
    if (loadMore && state.currentProjectsPagination.hasReachedMax) return;

    final nextPageIndex =
        loadMore ? state.currentProjectsPagination.pageIndex + 1 : 1;

    emit(state.copyWith(status: ProjectStatus.currentProjectsLoading));

    try {
      final response = await _projectRepo.currentProjects(
        pageIndex: nextPageIndex,
        pageSize: state.allProjectsPagination.pageSize,
        freelancerId: AppConstants.kUserId,
      );

      final newProjects = response.items;
      final hasReachedMax =
          newProjects.length < state.currentProjectsPagination.pageSize;

      emit(state.copyWith(
        status: ProjectStatus.currentProjectsSuccess,
        currentProjects:
            loadMore ? [...state.currentProjects, ...newProjects] : newProjects,
        currentProjectsPagination: state.currentProjectsPagination.copyWith(
          pageIndex: nextPageIndex,
          hasReachedMax: hasReachedMax,
          count: response.count,
        ),
      ));
    } catch (e) {
      emit(state.copyWith(
        status: ProjectStatus.currentProjectsFailure,
        errorMessage: ServerFailure.fromError(e).errMessage,
      ));
    }
  }

  //! create project
  Future<void> createProject(
    String projectName,
    String projectDescription,
    int minBudget,
    int maxBudget,
    int days,
    List<PlatformFile> files,
  ) async {
    emit(state.copyWith(status: ProjectStatus.createProjectLoading));

    try {
      final model = CreateProjectRequestModel(
        projectName: projectName,
        description: projectDescription,
        minPrice: minBudget,
        maxPrice: maxBudget,
        days: days,
        fromLanguageId: state.fromLanguage!.id,
        toLanguageId: state.toLanguage!.id,
        specializationId: state.industryId!,
        files: await prepareFiles(files),
      );

      await _projectRepo.createProject(model);
      emit(state.copyWith(
        status: ProjectStatus.createProjectSuccess,
        message: 'Project Created Successfully',
      ));
    } catch (e) {
      emit(state.copyWith(
        status: ProjectStatus.createProjectFailure,
        errorMessage: ServerFailure.fromError(e).errMessage,
      ));
    }
  }

  //! update project
  Future<void> updateProject(
    ProjectModel projectModel, {
    String? projectName,
    String? projectDescription,
    int? minBudget,
    int? maxBudget,
    int? days,
    List<PlatformFile>? files,
  }) async {
    emit(state.copyWith(status: ProjectStatus.updateProjectLoading));

    try {
      final model = await _buildUpdatProjectModel(
        projectName,
        projectModel,
        projectDescription,
        minBudget,
        maxBudget,
        days,
        files,
      );

      await _projectRepo.updateProject(model, projectModel.id);
      emit(state.copyWith(
        status: ProjectStatus.updateProjectSuccess,
        message: 'Project Updated Successfully',
      ));
    } catch (e) {
      emit(state.copyWith(
        status: ProjectStatus.updateProjectFailure,
        errorMessage: ServerFailure.fromError(e).errMessage,
      ));
    }
  }

//! Delete project
  Future<void> deleteProject(int projectId) async {
    emit(state.copyWith(status: ProjectStatus.deleteProjectLoading));
    try {
      await _projectRepo.deleteProject(projectId);
      emit(state.copyWith(
        status: ProjectStatus.deleteProjectSuccess,
        message: 'Project Deleted Successfully',
      ));
    } catch (e) {
      emit(state.copyWith(
        status: ProjectStatus.deleteProjectFailure,
        errorMessage: ServerFailure.fromError(e).errMessage,
      ));
    }
  }

  void setProjectData({
    LanguageModel? fromLanguage,
    LanguageModel? toLanguage,
    int? industryId,
  }) {
    emit(state.copyWith(
      fromLanguage: fromLanguage,
      toLanguage: toLanguage,
      industryId: industryId,
    ));
  }

  Future<CreateProjectRequestModel> _buildUpdatProjectModel(
      String? projectName,
      ProjectModel projectModel,
      String? projectDescription,
      int? minBudget,
      int? maxBudget,
      int? days,
      List<PlatformFile>? files) async {
    return CreateProjectRequestModel(
      projectName:
          projectName.isNullOrEmpty() ? projectModel.name : projectName!,
      description: projectDescription.isNullOrEmpty()
          ? projectModel.description
          : projectDescription!,
      minPrice: (minBudget.toString().isNullOrEmpty() || minBudget == 0)
          ? projectModel.minPrice
          : minBudget!,
      maxPrice: (maxBudget.toString().isNullOrEmpty() || maxBudget == 0)
          ? projectModel.maxPrice
          : maxBudget!,
      days: (days.toString().isNullOrEmpty() || days == 0)
          ? projectModel.days
          : days!,
      fromLanguageId: state.fromLanguage!.id,
      toLanguageId: state.toLanguage!.id,
      specializationId: state.industryId!,
      files: await prepareFiles(files),
    );
  }

  //! set project status
  int projectStatus = 0;
  void setProjectStatus(int status) {
    projectStatus = status;
    emit(state.copyWith(status: ProjectStatus.setProjectStatus));
  }

  //! send project review
  Future<void> sendProjectReview(int projectId) async {
    emit(state.copyWith(status: ProjectStatus.sendReviewLoading));
    log(projectId.toString());
    try {
      await _projectRepo.sendProjectReview(projectId: projectId);
      emit(state.copyWith(
        status: ProjectStatus.sendReviewSuccess,
        message: 'Review Sent Successfully',
      ));
    } catch (e) {
      emit(state.copyWith(
        status: ProjectStatus.sendReviewFailure,
        errorMessage: ServerFailure.fromError(e).errMessage,
      ));
    }
  }

  //! mark project as finished
  Future<void> markProjectAsFinished(int projectId) async {
    emit(state.copyWith(status: ProjectStatus.markAsFinishedLoading));
    try {
      await _projectRepo.markProjectAsFinished(projectId: projectId);
      emit(state.copyWith(
        status: ProjectStatus.markAsFinishedSuccess,
        message: 'Project Marked as Finished Successfully',
      ));
    } catch (e) {
      emit(state.copyWith(
        status: ProjectStatus.markAsFinishedFailure,
        errorMessage: ServerFailure.fromError(e).errMessage,
      ));
    }
  }

  //! get statistics
  Future<void> getStatistics() async {
    emit(state.copyWith(status: ProjectStatus.getStatisticsLoading));
    try {
      final response = await _projectRepo.getStatisticsProjectsFreelancer(
        freelancerId: AppConstants.kUserId,
      );
      emit(state.copyWith(
        status: ProjectStatus.getStatisticsSuccess,
        message: 'Statistics Retrieved Successfully',
        statistics: response,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: ProjectStatus.getStatisticsFailure,
        errorMessage: ServerFailure.fromError(e).errMessage,
      ));
    }
  }

  
}
