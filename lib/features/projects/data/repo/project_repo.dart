import '../models/create_project_request_model.dart';
import '../models/project_model.dart';
import '../models/project_response_model.dart';

abstract class ProjectRepo {
  Future<void> createProject(CreateProjectRequestModel model);
  Future<void> updateProject(CreateProjectRequestModel model, int projectId);
  Future<void> deleteProject(int projectId);
  Future<List<ProjectModel>> getUpcomingProjects();
  Future<List<ProjectModel>> getStartedProjects();
  Future<ProjectResponseModel> getAllProjects({
    required int pageIndex,
    required int pageSize,
  });

  Future<void> sendProjectReview({required int projectId});
  Future<void> markProjectAsFinished({required int projectId});
}
