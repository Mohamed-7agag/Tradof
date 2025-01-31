import 'package:dartz/dartz.dart';
import 'package:tradof/core/api/api_service.dart';
import 'package:tradof/core/errors/failure.dart';
import 'package:tradof/features/projects/data/models/create_project_request_model.dart';

import '../../../../core/api/end_points.dart';
import '../../../../core/helpers/handle_request_method.dart';
import 'project_repo.dart';

class ProjectRepoImpl implements ProjectRepo {
  final ApiServices _apiServices;

  ProjectRepoImpl({required ApiServices apiServices})
      : _apiServices = apiServices;

  @override
  Future<Either<Failure, String>> createProject(
      CreateProjectRequestModel model) {
    return handleRequest(() async {
      final response = await _apiServices.post(
        EndPoint.createProject,
        data: model.toJson(),
      );
      return response;
    });
  }
}
