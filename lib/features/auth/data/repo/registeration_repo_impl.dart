import 'package:dartz/dartz.dart';
import 'package:tradof/core/api/end_points.dart';
import 'package:tradof/core/errors/failure.dart';

import '../../../../core/api/api_service.dart';
import '../../../../core/helpers/handle_request_method.dart';
import 'registeration_repo.dart';

class RegisterationRepoImpl implements RegisterationRepo {
  final ApiServices _apiServices;

  RegisterationRepoImpl({required ApiServices apiServices})
      : _apiServices = apiServices;
  @override
  Future<Either<Failure, String>> freelancerRegister() {
    return handleRequest(() async {
      final response = await _apiServices.post(
        EndPoint.registerFreelancer,
        data: {},
      );
      return response; // or parse the response
    });
  }

  @override
  Future<Either<Failure, String>> companyRegister() {
    return handleRequest(() async {
      final response = await _apiServices.post(
        EndPoint.registerCompany,
        data: {},
      );
      return response;
    });
  }

  @override
  Future<Either<Failure, String>> getCountries() {
    // TODO: implement getCountries
    throw UnimplementedError();
  }
}
