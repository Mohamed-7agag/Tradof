import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradof/core/helpers/upload_file_to_api.dart';
import 'package:tradof/features/auth/data/model/language_model.dart';

import '../../../data/models/create_project_request_model.dart';
import '../../../data/repo/project_repo.dart';

part 'project_state.dart';

class ProjectCubit extends Cubit<ProjectState> {
  ProjectCubit(this._projectRepo) : super(ProjectState());
  final ProjectRepo _projectRepo;

  // create project
  Future<void> createProject(String projectName, String projectDescription,
      int minBudget, int maxBudget, List<PlatformFile> files) async {
    emit(state.copyWith(status: ProjectStatus.loading));

    final model = CreateProjectRequestModel(
      projectName: projectName,
      description: projectDescription,
      minPrice: minBudget,
      maxPrice: maxBudget,
      deliveryDate: state.projectDeliveryDate!,
      fromLanguageId: state.fromLanguage!.id,
      toLanguageId: state.toLanguage!.id,
      files: await uploadFileToApi(files[0]), //
      
    );

    final result = await _projectRepo.createProject(model);
    result.fold(
      (failure) => emit(state.copyWith(
        status: ProjectStatus.error,
        errorMessage: failure.errMessage,
      )),
      (message) => emit(state.copyWith(
        status: ProjectStatus.success,
        message: message,
      )),
    );
  }

  void setLanguagePair(
      {LanguageModel? fromLanguage, LanguageModel? toLanguage}) {
    emit(state.copyWith(fromLanguage: fromLanguage, toLanguage: toLanguage));
  }

  void setProjectDeliveryDate(String date) {
    emit(state.copyWith(projectDeliveryDate: date));
  }
}
