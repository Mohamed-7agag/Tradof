import 'package:tradof/features/auth/data/model/reset_password_request_model.dart';

import '../model/login_response_model.dart';

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
  Future<String> resetPassword(
    ResetPasswordRequestModel resetPasswordRequestModel,
  );
}
