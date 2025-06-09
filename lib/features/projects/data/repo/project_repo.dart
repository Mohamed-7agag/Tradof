import '../models/create_project_request_model.dart';
import '../models/project_model.dart';
import '../models/project_response_model.dart';
import '../models/project_statistics_model.dart';
import '../models/rating_request_model.dart';

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
  Future<ProjectStatisticsModel> getCurrentProjectsStatistics();
  Future<void> giveRating({required RatingRequestModel ratingRequestModel});
  Future<void> uploadFiles({required int projectId, required bool isFreelancer});
  Future<void> deleteFile({required int fileId});

  Future<ProjectModel> getProjectByID({required int projectId});

}
