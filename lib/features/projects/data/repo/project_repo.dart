import 'package:tradof/features/projects/data/models/create_project_request_model.dart';
import 'package:tradof/features/projects/data/models/project_model.dart';

abstract class ProjectRepo {
  Future<void> createProject(CreateProjectRequestModel model);
  Future<void> updateProject(CreateProjectRequestModel model);
  Future<void> deleteProject(int projectId);
  Future<List<ProjectModel>> getUpcomingProjects();
}
