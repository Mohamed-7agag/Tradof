import 'package:dartz/dartz.dart';
import 'package:tradof/core/api/api_service.dart';
import 'package:tradof/core/errors/failure.dart';

import '../../../../../core/api/end_points.dart';
import '../../../../../core/helpers/handle_request_method.dart';
import '../../../../../core/utils/app_constants.dart';
import '../model/update_freelancer_request_model.dart';
import 'freelancer_setting_repo.dart';

class FreelancerSettingRepoImpl implements FreelancerSettingRepo {
  final ApiServices _apiServices;

  FreelancerSettingRepoImpl({required ApiServices apiServices})
      : _apiServices = apiServices;
  @override
  Future<Either<Failure, String>> changeFreelancerPassword(
      {required String currentPassword, required String newPassword}) {
    return handleRequest(() async {
      final response = await _apiServices.post(
        EndPoint.changeFreelancerPassword(AppConstants.kUserId),
        data: {
          'currentPassword': currentPassword,
          'newPassword': newPassword,
          'confirmPassword': newPassword,
        },
      );
      return response;
    });
  }

  @override
  Future<Either<Failure, String>> updateCompanyProfile(
      {required UpdateFreelancerRequestModel updateFreelancerRequestModel}) {
    return handleRequest(() async {
      final response = await _apiServices.put(
        EndPoint.updateFreelancerProfile(AppConstants.kUserId),
        data: updateFreelancerRequestModel.toJson(),
      );
      return response;
    });
  }
}
