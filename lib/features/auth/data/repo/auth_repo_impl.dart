import 'package:dartz/dartz.dart';
import 'package:tradof/core/api/api_service.dart';
import 'package:tradof/core/errors/failure.dart';
import 'package:tradof/core/helpers/handle_request_method.dart';
import 'package:tradof/features/auth/data/repo/auth_repo.dart';

import '../../../../core/api/end_points.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiServices apiServices;

  AuthRepoImpl({required this.apiServices});
  @override
  Future<Either<Failure, String>> login(String email, String password) {
    return handleRequest(() async {
      final response = await apiServices.post(
        EndPoint.login,
        // data: loginRequestModel.toJson(),
      );
      //return LoginResponseModel.fromJson(response);
      return 'success';
    });
  }

  @override
  Future<Either<Failure, String>> forgetPassword(String email) {
    return handleRequest(() async {
      final response = await apiServices.post(
        EndPoint.forgetPassword,
        data: {'email': email},
      );
      return response;
    });
  }

  @override
  Future<Either<Failure, String>> resetPassword(String newPassword) {
    return handleRequest(() async {
      final response = await apiServices.post(
        EndPoint.resetPassword,
        data: {'newPassword': newPassword},
      );
      return response;
    });
  }

  @override
  Future<Either<Failure, String>> verifyOtp(String email, String otp) {
    return handleRequest(() async {
      final response = await apiServices.post(
        EndPoint.verifyOtp,
        data: {'email': email, 'otp': otp},
      );
      return response;
    });
  }
}
