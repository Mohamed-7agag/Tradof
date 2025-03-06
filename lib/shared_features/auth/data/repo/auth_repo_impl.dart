import '../../../../core/api/api_service.dart';
import '../../../../core/api/end_points.dart';
import '../model/company_register_request_model.dart';
import '../model/freelancer_register_request_model.dart';
import '../model/login_response_model.dart';
import '../model/reset_password_request_model.dart';
import 'auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  AuthRepoImpl({required ApiServices apiServices}) : _apiServices = apiServices;
  final ApiServices _apiServices;

  @override
  Future<LoginResponseModel> login(String email, String password) async {
    final response = await _apiServices.post(
      EndPoint.login,
      data: {'email': email, 'password': password},
    );
    return LoginResponseModel.fromJson(response);
  }

  @override
  Future<String> forgetPassword(String email) async {
    return await _apiServices.post(
      EndPoint.forgetPassword,
      data: {'email': email},
    );
  }

  @override
  Future<Map<String, dynamic>> verifyOtp(String email, String otp) async {
    return await _apiServices.post(
      EndPoint.verifyOtp,
      data: {'email': email, 'otp': otp},
    );
  }

  @override
  Future<String> resendOtp(String email) async {
    return await _apiServices.post(
      EndPoint.resendOtp,
      data: {'email': email},
    );
  }

  @override
  Future<String> resetPassword(
      ResetPasswordRequestModel resetPasswordRequestModel) async {
    return await _apiServices.post(
      EndPoint.resetPassword,
      data: resetPasswordRequestModel.toJson(),
    );
  }

  @override
  Future<String> freelancerRegister(
      FreelancerRegisterRequestModel freelancerRegisterRequestModel) async {
    return await _apiServices.post(
      EndPoint.registerFreelancer,
      data: freelancerRegisterRequestModel.toJson(),
    );
  }

  @override
  Future<String> companyRegister(
      CompanyRegisterRequestModel companyRegisterRequestModel) async {
    return await _apiServices.post(
      EndPoint.registerCompany,
      data: companyRegisterRequestModel.toJson(),
    );
  }
}
