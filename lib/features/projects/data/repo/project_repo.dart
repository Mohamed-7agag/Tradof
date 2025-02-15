import 'package:tradof/features/projects/data/models/create_project_request_model.dart';

abstract class ProjectRepo {
  Future<void> createProject(CreateProjectRequestModel model);
}
