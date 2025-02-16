import 'package:tradof/core/api/api_service.dart';
import 'package:tradof/core/utils/app_constants.dart';

import '../../../../core/api/end_points.dart';
import '../models/create_project_request_model.dart';
import '../models/project_model.dart';
import 'project_repo.dart';

class ProjectRepoImpl implements ProjectRepo {
  final ApiServices _apiServices;

  ProjectRepoImpl({required ApiServices apiServices})
      : _apiServices = apiServices;

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
  Future<List<ProjectModel>> getUpcomingProjects() async {
    final response = await _apiServices.get(
      EndPoint.getUpcomingProjects,
    );
    return List<ProjectModel>.from(
      response.map((project) => ProjectModel.fromJson(project)),
    );
  }
}
