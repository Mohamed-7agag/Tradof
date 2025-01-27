import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';

abstract class AuthRepo {
  Future<Either<Failure, String>> login(String email, String password);
  Future<Either<Failure, String>> forgetPassword(String email);
  Future<Either<Failure, String>> verifyOtp(String email, String otp);
  Future<Either<Failure, String>> resetPassword(String newPassword);
}