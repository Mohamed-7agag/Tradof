import 'package:dartz/dartz.dart';
import 'package:tradof/core/errors/failure.dart';
import 'package:tradof/features/projects/data/models/create_project_request_model.dart';

abstract class ProjectRepo {
  Future<Either<Failure, Unit>> createProject(CreateProjectRequestModel model);
}
