import 'package:dartz/dartz.dart';
import 'package:tradof/core/api/api_service.dart';
import 'package:tradof/core/errors/failure.dart';
import 'package:tradof/core/helpers/handle_request_method.dart';
import 'package:tradof/features/auth/data/model/reset_password_request_model.dart';
import 'package:tradof/features/auth/data/repo/auth_repo.dart';

import '../../../../core/api/end_points.dart';
import '../model/login_response_model.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiServices _apiServices;

  AuthRepoImpl({required ApiServices apiServices}) : _apiServices = apiServices;
  @override
  Future<Either<Failure, LoginResponseModel>> login(
      String email, String password) {
    return handleRequest(() async {
      final response = await _apiServices.post(
        EndPoint.login,
        data: {'email': email, 'password': password},
      );
      return LoginResponseModel.fromJson(response);
    });
  }

  @override
  Future<Either<Failure, String>> forgetPassword(String email) {
    return handleRequest(() async {
      final response = await _apiServices.post(
        EndPoint.forgetPassword,
        data: {'email': email},
      );
      return response;
    });
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> verifyOtp(
      String email, String otp) {
    return handleRequest(() async {
      final response = await _apiServices.post(
        EndPoint.verifyOtp,
        data: {'email': email, 'otp': otp},
      );
      return response;
    });
  }

  @override
  Future<Either<Failure, String>> resetPassword(
      ResetPasswordRequestModel resetPasswordRequestModel) {
    return handleRequest(() async {
      final response = await _apiServices.post(
        EndPoint.resetPassword,
        data: resetPasswordRequestModel.toJson(),
      );
      return response;
    });
  }
}
