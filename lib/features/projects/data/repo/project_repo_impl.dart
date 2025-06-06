import '../../../../core/api/api_service.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../finances/data/model/statistics_model.dart';
import '../models/create_project_request_model.dart';
import '../models/project_response_model.dart';
import 'project_repo.dart';

class ProjectRepoImpl implements ProjectRepo {
  ProjectRepoImpl({required ApiServices apiServices})
      : _apiServices = apiServices;
  final ApiServices _apiServices;

  @override
  Future<void> createProject(CreateProjectRequestModel model) async {
    await _apiServices.post(
      EndPoint.createProject,
      data: model.toJson(),
      queryParameters: {"companyId": AppConstants.kUserId},
      isFormData: true,
    );
  }

  @override
  Future<void> updateProject(
      CreateProjectRequestModel model, int projectId) async {
    await _apiServices.put(
      EndPoint.allProjects,
      data: {
        "id": projectId,
        ...model.toJson(),
      },
      queryParameters: {"companyId": AppConstants.kUserId},
      isFormData: true,
    );
  }

  @override
  Future<ProjectResponseModel> getUpcomingProjects({
    required int pageIndex,
    required int pageSize,
    required String companyId,
  }) async {
    final response = await _apiServices.get(
      EndPoint.getUpcomingProjects,
      queryParameters: {
        'companyId': companyId,
        'pageIndex': pageIndex,
        'pageSize': pageSize,
      },
    );
    return ProjectResponseModel.fromJson(response['data']);
  }

  @override
  Future<ProjectResponseModel> getStartedProjects({
    required int pageIndex,
    required int pageSize,
    required String companyId,
  }) async {
    final response = await _apiServices.get(
      EndPoint.getStartedProjects,
      queryParameters: {
        'companyId': companyId,
        'pageIndex': pageIndex,
        'pageSize': pageSize,
      },
    );
    return ProjectResponseModel.fromJson(response);
  }

  @override
  Future<void> deleteProject(int projectId) async {
    await _apiServices.delete(
      EndPoint.deleteProject(projectId),
    );
  }

  @override
  Future<ProjectResponseModel> getAllProjects(
      {required int pageIndex, required int pageSize}) async {
    final response = await _apiServices.get(
      EndPoint.allProjects,
      queryParameters: {
        'pageIndex': pageIndex,
        'pageSize': pageSize,
      },
    );
    return ProjectResponseModel.fromJson(response['data']);
  }

  @override
  Future<ProjectResponseModel> currentProjects({
    required int pageIndex,
    required int pageSize,
    required String freelancerId,
  }) async {
    final response = await _apiServices.get(
      EndPoint.currentProjects,
      queryParameters: {
        'freelancerId': freelancerId,
        'pageIndex': pageIndex,
        'pageSize': pageSize,
      },
    );
    return ProjectResponseModel.fromJson(response);
  }

  @override
  Future<void> sendProjectReview({required int projectId}) async {
    await _apiServices.put(
      EndPoint.sendProjectReview(projectId, AppConstants.kUserId),
    );
  }

  @override
  Future<void> markProjectAsFinished({required int projectId}) async {
    await _apiServices.put(
      EndPoint.markProjectAsFinished(projectId),
    );
  }
}
