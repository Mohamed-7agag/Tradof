import '../../../../../core/api/api_service.dart';
import '../../../../../core/api/end_points.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../model/update_company_request_model.dart';
import '../../model/update_freelancer_request_model.dart';
import 'setting_repo.dart';

class SettingRepoImpl implements SettingRepo {
  SettingRepoImpl({required ApiServices apiServices})
      : _apiServices = apiServices;
  final ApiServices _apiServices;
  @override
  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
    required bool isFreelancer,
  }) async {
    await _apiServices.post(
      isFreelancer
          ? EndPoint.changeFreelancerPassword(AppConstants.kUserId)
          : EndPoint.changeCompanyPassword(AppConstants.kUserId),
      data: {
        'currentPassword': currentPassword,
        'newPassword': newPassword,
        'confirmPassword': newPassword,
      },
    );
  }

  @override
  Future<String> updateCompanyProfile({
    required UpdateCompanyRequestModel updateCompanyRequestModel,
  }) async {
    return await _apiServices.put(
      EndPoint.updateCompanyProfile,
      data: updateCompanyRequestModel.toJson(),
    );
  }

  @override
  Future<void> updateFreelancerProfile({
    required UpdateFreelancerRequestModel updateFreelancerRequestModel,
  }) async {
    await _apiServices.put(
      EndPoint.updateFreelancerProfile(AppConstants.kUserId),
      data: updateFreelancerRequestModel.toJson(),
    );
  }
}
