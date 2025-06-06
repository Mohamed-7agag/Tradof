import '../models/create_project_request_model.dart';
import '../models/project_response_model.dart';
import '../models/statistics_project_model.dart';

abstract class ProjectRepo {
  Future<void> createProject(CreateProjectRequestModel model);
  Future<void> updateProject(CreateProjectRequestModel model, int projectId);
  Future<void> deleteProject(int projectId);
  Future<ProjectResponseModel> getAllProjects({
    required int pageIndex,
    required int pageSize,
  });

  Future<ProjectResponseModel> currentProjects({
    required int pageIndex,
    required int pageSize,
    required String freelancerId,
  });
  Future<ProjectResponseModel> getUpcomingProjects({
    required int pageIndex,
    required int pageSize,
    required String companyId,
  });
  Future<ProjectResponseModel> getStartedProjects({
    required int pageIndex,
    required int pageSize,
    required String companyId,
  });

  Future<void> sendProjectReview({required int projectId});
  Future<void> markProjectAsFinished({required int projectId});

  Future<StatisticsProjectModel> getStatisticsProjectsFreelancer({
    required String freelancerId,
  });
}
