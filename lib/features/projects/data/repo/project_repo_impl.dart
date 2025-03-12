import '../../../../core/api/api_service.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/utils/app_constants.dart';
import '../models/create_project_request_model.dart';
import '../models/project_model.dart';
import '../models/project_response_model.dart';
import 'project_repo.dart';

class ProjectRepoImpl implements ProjectRepo {
  ProjectRepoImpl({required ApiServices apiServices})
      : _apiServices = apiServices;
  final ApiServices _apiServices;

  @override
  Future<void> createProject(CreateProjectRequestModel model) async {
    await _apiServices.post(
      EndPoint.project,
      data: model.toJson(),
      queryParameters: {"companyId": AppConstants.kUserId},
      isFormData: true,
    );
  }

  @override
  Future<void> updateProject(CreateProjectRequestModel model, int projectId) async {
    await _apiServices.put(
      EndPoint.project,
      data: {
        "id": projectId,
        ...model.toJson(),
      },
      queryParameters: {"companyId": AppConstants.kUserId},
      isFormData: true,
    );
  }

  @override
  Future<List<ProjectModel>> getUpcomingProjects() async {
    final response = await _apiServices.get(
      EndPoint.getUpcomingProjects,
      queryParameters: {"companyId": AppConstants.kUserId},
    );
    return List<ProjectModel>.from(
      response.map((project) => ProjectModel.fromJson(project)),
    );
  }

  @override
  Future<List<ProjectModel>> getStartedProjects() async {
    final response = await _apiServices.get(
      EndPoint.getStartedProjects,
    );
    return List<ProjectModel>.from(
      response.map((project) => ProjectModel.fromJson(project)),
    );
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
    final response = await _apiServices.get(EndPoint.project, queryParameters: {
      'pageIndex': pageIndex,
      'pageSize': pageSize,
    });
    return ProjectResponseModel.fromJson(response);
  }
}
