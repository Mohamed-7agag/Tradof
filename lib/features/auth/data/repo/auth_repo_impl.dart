import '../../../../core/api/api_service.dart';
import '../../../../core/api/end_points.dart';
import '../model/login_response_model.dart';
import '../model/reset_password_request_model.dart';
import 'auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiServices _apiServices;
  AuthRepoImpl({required ApiServices apiServices}) : _apiServices = apiServices;

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
    final response = await _apiServices.post(
      EndPoint.forgetPassword,
      data: {'email': email},
    );
    return response;
  }

  @override
  Future<Map<String, dynamic>> verifyOtp(String email, String otp) async {
    final response = await _apiServices.post(
      EndPoint.verifyOtp,
      data: {'email': email, 'otp': otp},
    );
    return response;
  }

  @override
  Future<String> resetPassword(
      ResetPasswordRequestModel resetPasswordRequestModel) async {
    final response = await _apiServices.post(
      EndPoint.resetPassword,
      data: resetPasswordRequestModel.toJson(),
    );
    return response;
  }
}
