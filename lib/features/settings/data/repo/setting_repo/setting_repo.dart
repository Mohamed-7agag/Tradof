import '../../model/update_company_request_model.dart';
import '../../model/update_freelancer_request_model.dart';

abstract class SettingRepo {
  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
    required bool isFreelancer,
  });
  Future<String> updateCompanyProfile({
    required UpdateCompanyRequestModel updateCompanyRequestModel,
  });
  Future<void> updateFreelancerProfile({
    required UpdateFreelancerRequestModel updateFreelancerRequestModel,
  });
}
