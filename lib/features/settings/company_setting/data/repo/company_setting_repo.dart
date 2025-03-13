import '../../../model/update_company_request_model.dart';

abstract class CompanySettingRepo {
  Future<void> changeCompanyPassword({
    required String currentPassword,
    required String newPassword,
  });
  Future<String> updateCompanyProfile({
    required UpdateCompanyRequestModel updateCompanyRequestModel,
  });
}
