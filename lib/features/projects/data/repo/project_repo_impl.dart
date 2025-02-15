import 'package:tradof/core/api/api_service.dart';
import 'package:tradof/core/utils/app_constants.dart';
import 'package:tradof/features/projects/data/models/create_project_request_model.dart';

import '../../../../core/api/end_points.dart';
import 'project_repo.dart';

class ProjectRepoImpl implements ProjectRepo {
  final ApiServices _apiServices;

  ProjectRepoImpl({required ApiServices apiServices})
      : _apiServices = apiServices;

  @override
  Future<void> createProject(CreateProjectRequestModel model) async {
    await _apiServices.post(
      EndPoint.createProject(AppConstants.kUserId),
      data: model.toJson(),
      isFormData: true,
    );
  }
}
