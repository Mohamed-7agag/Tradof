import '../model/company_register_request_model.dart';
import '../model/freelancer_register_request_model.dart';
import '../model/login_response_model.dart';
import '../model/reset_password_request_model.dart';

abstract class AuthRepo {
  Future<LoginResponseModel> login(
    String email,
    String password,
  );
  Future<String> forgetPassword(
    String email,
  );
  Future<Map<String, dynamic>> verifyOtp(
    String email,
    String otp,
  );
  Future<String> resendOtp(
    String email,
  );
  Future<String> resetPassword(
    ResetPasswordRequestModel resetPasswordRequestModel,
  );
  // register
  Future<String> freelancerRegister(
    FreelancerRegisterRequestModel freelancerRegisterRequestModel,
  );
  Future<String> companyRegister(
    CompanyRegisterRequestModel companyRegisterRequestModel,
  );
}
