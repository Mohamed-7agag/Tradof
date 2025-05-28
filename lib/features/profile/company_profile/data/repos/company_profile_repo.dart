import '../model/company_employee_model.dart';
import '../model/company_employee_request_model.dart';
import '../model/company_model.dart';
import '../model/social_media_model.dart';

abstract class CompanyProfileRepo {
  Future<CompanyModel> getCompanyProfrile({
    required String companyId,
  });
  Future<List<CompanyEmployeeModel>> getCompanyEmployees({
    required String companyId,
  });

  Future<String> addCompanyEmployee({
    required CompanyEmployeeRequestModel employeeModel,
  });

  Future<void> addPreferedLanguages({
    required List<int> languagesIds,
  });
  Future<void> deletePreferedLanguages({
    required List<int> languagesIds,
  });

  Future<void> addIndustriesServed({
    required List<int> industriesIds,
  });
  Future<void> deleteIndustriesServed({
    required List<int> industriesIds,
  });

  Future<String> updateSocialMedia({
    required List<SocialMediaModel> socialMediaModel,
  });
  Future<void> increaseProfileViews({
    required String companyId,
  });
}
