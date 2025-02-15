import 'package:tradof/core/api/end_points.dart';

import '../../../../core/api/api_service.dart';
import '../model/company_register_request_model.dart';
import '../model/freelancer_register_request_model.dart';
import 'registeration_repo.dart';

class RegisterationRepoImpl implements RegisterationRepo {
  final ApiServices _apiServices;

  RegisterationRepoImpl({required ApiServices apiServices})
      : _apiServices = apiServices;

  @override
  Future<String> freelancerRegister(
      FreelancerRegisterRequestModel freelancerRegisterRequestModel) async {
    final response = await _apiServices.post(
      EndPoint.registerFreelancer,
      data: freelancerRegisterRequestModel.toJson(),
    );
    return response;
  }

  @override
  Future<String> companyRegister(
      CompanyRegisterRequestModel companyRegisterRequestModel) async {
    final response = await _apiServices.post(
      EndPoint.registerCompany,
      data: companyRegisterRequestModel.toJson(),
    );
    return response;
  }
}
