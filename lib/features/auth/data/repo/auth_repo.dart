import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../model/login_response_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, LoginResponseModel>> login(String email, String password);
  Future<Either<Failure, String>> forgetPassword(String email);
  Future<Either<Failure, Map<String, dynamic>>> verifyOtp(String email, String otp);
  Future<Either<Failure, String>> resetPassword(String newPassword, String resetToken, String email);
}