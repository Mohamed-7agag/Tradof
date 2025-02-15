import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradof/core/helpers/upload_file_to_api.dart';
import 'package:tradof/core/utils/models/language_model.dart';

import '../../../../../core/errors/exception.dart';
import '../../../data/models/create_project_request_model.dart';
import '../../../data/repo/project_repo.dart';

part 'project_state.dart';

class ProjectCubit extends Cubit<ProjectState> {
  ProjectCubit(this._projectRepo) : super(ProjectState());
  final ProjectRepo _projectRepo;

  // create project
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
      Future<List<MultipartFile>> prepareFiles() {
        final convertedFiles =
            files.map((file) async => await uploadFileToApi(file)).toList();
        return Future.wait(convertedFiles);
      }

      final model = CreateProjectRequestModel(
        projectName: projectName,
        description: projectDescription,
        minPrice: minBudget,
        maxPrice: maxBudget,
        days: days,
        fromLanguageId: state.fromLanguage!.id,
        toLanguageId: state.toLanguage!.id,
        specializationId: state.industryId!,
        files: await prepareFiles(), //!
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

  void setCreateProjectData({
    LanguageModel? fromLanguage,
    LanguageModel? toLanguage,
    int? days,
    int? industryId,
  }) {
    emit(state.copyWith(
      fromLanguage: fromLanguage,
      toLanguage: toLanguage,
      industryId: industryId,
    ));
  }
}
