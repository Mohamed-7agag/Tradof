import '../../../../core/api/api_service.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/utils/app_constants.dart';
import '../model/update_company_request_model.dart';
import 'company_setting_repo.dart';

class CompanySettingRepoImpl implements CompanySettingRepo {
  CompanySettingRepoImpl({required ApiServices apiServices})
      : _apiServices = apiServices;
  final ApiServices _apiServices;
  @override
  Future<void> changeCompanyPassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    await _apiServices.post(
      EndPoint.changeCompanyPassword(AppConstants.kUserId),
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
}
