import '../../../../core/api/api_service.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/utils/app_constants.dart';
import '../model/update_freelancer_request_model.dart';
import 'freelancer_setting_repo.dart';

class FreelancerSettingRepoImpl implements FreelancerSettingRepo {

  FreelancerSettingRepoImpl({required ApiServices apiServices})
      : _apiServices = apiServices;
  final ApiServices _apiServices;
  @override
  Future<void> changeFreelancerPassword(
      {required String currentPassword, required String newPassword}) async {
    await _apiServices.post(
      EndPoint.changeFreelancerPassword(AppConstants.kUserId),
      data: {
        'currentPassword': currentPassword,
        'newPassword': newPassword,
        'confirmPassword': newPassword,
      },
    );
  }

  @override
  Future<void> updateCompanyProfile({
    required UpdateFreelancerRequestModel updateFreelancerRequestModel,
  }) async {
    await _apiServices.put(
      EndPoint.updateFreelancerProfile(AppConstants.kUserId),
      data: updateFreelancerRequestModel.toJson(),
    );
  }
}
