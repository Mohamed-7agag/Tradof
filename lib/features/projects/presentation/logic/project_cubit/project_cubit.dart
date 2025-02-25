import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/exception.dart';
import '../../../../../core/helpers/extensions.dart';
import '../../../../../core/helpers/prepare_files.dart';
import '../../../../../core/utils/models/language_model.dart';
import '../../../data/models/create_project_request_model.dart';
import '../../../data/models/project_model.dart';
import '../../../data/repo/project_repo.dart';

part 'project_state.dart';

class ProjectCubit extends Cubit<ProjectState> {
  ProjectCubit(this._projectRepo) : super(const ProjectState());
  final ProjectRepo _projectRepo;

//! get upcoming projects
  Future<void> getUpcomingProjects() async {
    emit(state.copyWith(status: ProjectStatus.getUpcomingProjectsLoading));
    try {
      final projects = await _projectRepo.getUpcomingProjects();
      emit(state.copyWith(
        status: ProjectStatus.getUpcomingProjectsSuccess,
        upcomingProjects: projects,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: ProjectStatus.getUpcomingProjectsFailure,
        errorMessage: ServerFailure.fromError(e).errMessage,
      ));
    }
  }

  //! get started projects
  Future<void> getStartedProjects() async {
    emit(state.copyWith(status: ProjectStatus.getStartedtProjectsLoading));
    try {
      final projects = await _projectRepo.getStartedProjects();
      emit(state.copyWith(
        status: ProjectStatus.getStartedtProjectsSuccess,
        startedProjects: projects,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: ProjectStatus.getStartedtProjectsFailure,
        errorMessage: ServerFailure.fromError(e).errMessage,
      ));
    }
  }

  Future<void> getAllProjects({bool loadMore = false}) async {
    if (loadMore && state.hasReachedMax) return;

    final nextPageIndex = loadMore ? state.pageIndex + 1 : 1;

    emit(state.copyWith(status: ProjectStatus.getAllProjectsLoading));

    try {
      final response = await _projectRepo.getAllProjects(
        pageIndex: nextPageIndex,
        pageSize: state.pageSize,
      );

      final newProjects = response.items;
      final hasReachedMax = newProjects.length < state.pageSize;

      emit(state.copyWith(
        status: ProjectStatus.getAllProjectsSuccess,
        allProjects: loadMore
            ? [...state.upcomingProjects, ...newProjects]
            : newProjects,
        pageIndex: nextPageIndex,
        hasReachedMax: hasReachedMax,
        count: response.count,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: ProjectStatus.getAllProjectsFailure,
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

      await _projectRepo.updateProject(model);
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

  void setCreateProjectData({
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
      specializationId: state.industryId ?? projectModel.specialization.id,
      files: await prepareFiles(files),
    );
  }
}
