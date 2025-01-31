import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/create_project_request_model.dart';
import '../../../data/repo/project_repo.dart';

part 'project_state.dart';

class ProjectCubit extends Cubit<ProjectState> {
  ProjectCubit(this._projectRepo) : super(ProjectState());
  final ProjectRepo _projectRepo;

  // create project
  Future<void> createProject(CreateProjectRequestModel model) async {
    emit(state.copyWith(status: ProjectStatus.loading));
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
}
