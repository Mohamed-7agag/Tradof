import 'package:tradof/features/projects/data/models/create_project_request_model.dart';
import 'package:tradof/features/projects/data/models/project_model.dart';

abstract class ProjectRepo {
  Future<void> createProject(CreateProjectRequestModel model);
  Future<List<ProjectModel>> getUpcomingProjects();
}
