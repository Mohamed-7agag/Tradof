import '../../../../../core/api/api_service.dart';
import '../../../../../core/api/end_points.dart';
import '../../../../../core/utils/app_constants.dart';
import '../model/company_employee_model.dart';
import '../model/company_employee_request_model.dart';
import '../model/company_model.dart';
import '../model/social_media_model.dart';
import 'company_profile_repo.dart';

class CompanyProfileRepoImpl implements CompanyProfileRepo {

  CompanyProfileRepoImpl({required ApiServices apiServices})
      : _apiServices = apiServices;
  final ApiServices _apiServices;

  @override
  Future<CompanyModel> getCompanyProfrile({required String companyId}) async {
    final response = await _apiServices.get(
      EndPoint.getCompanybyId(companyId),
    );
    return CompanyModel.fromJson(response);
  }

  @override
  Future<List<CompanyEmployeeModel>> getCompanyEmployees(
      {required String companyId}) async {
    final response = await _apiServices.get(
      EndPoint.getCompanyEmployees(companyId),
    );
    return List<CompanyEmployeeModel>.from(
      response.map<CompanyEmployeeModel>(
        (employee) => CompanyEmployeeModel.fromJson(employee),
      ),
    );
  }

  @override
  Future<String> addCompanyEmployee(
      {required CompanyEmployeeRequestModel employeeModel}) async {
    final response = await _apiServices.post(
      EndPoint.addCompanyEmployee,
      data: employeeModel.toJson(),
    );
    return response;
  }

  @override
  Future<String> addUpdateSocialMedia(
      {required List<SocialMediaModel> socialMediaModel}) async {
    final response = await _apiServices.post(
      EndPoint.freelancerSocialMediaCRUD(AppConstants.kUserId),
      data: socialMediaModel.map((e) => e.toJson()).toList(),
    );
    return response;
  }

  @override
  Future<void> addPreferedLanguages({required List<int> languagesIds}) async {
    await _apiServices.post(
      EndPoint.addPreferredLanguage(AppConstants.kUserId),
      data: languagesIds,
    );
  }

  @override
  Future<void> deletePreferedLanguages(
      {required List<int> languagesIds}) async {
    await _apiServices.delete(
      EndPoint.deletePreferredLanguage(AppConstants.kUserId),
      data: languagesIds,
    );
  }

  @override
  Future<void> addIndustriesServed({required List<int> industriesIds}) async {
    await _apiServices.post(
      EndPoint.addIndustries(AppConstants.kUserId),
      data: industriesIds,
    );
  }

  @override
  Future<void> deleteIndustriesServed(
      {required List<int> industriesIds}) async {
    await _apiServices.delete(
      EndPoint.deleteIndustries(AppConstants.kUserId),
      data: industriesIds,
    );
  }
}
