import 'package:dartz/dartz.dart';
import 'package:tradof/core/api/api_service.dart';
import 'package:tradof/core/errors/failure.dart';
import 'package:tradof/core/utils/app_constants.dart';

import '../../../../../core/api/end_points.dart';
import '../../../../../core/helpers/handle_request_method.dart';
import '../model/freelancer_model.dart';
import 'freelancer_repo.dart';

class FreelancerRepoImpl implements FreelancerRepo {
  final ApiServices _apiServices;

  FreelancerRepoImpl({required ApiServices apiServices})
      : _apiServices = apiServices;
  @override
  Future<Either<Failure, FreelancerModel>> getFreelancerProfile() {
    return handleRequest(() async {
      final response = await _apiServices.get(
        EndPoint.getFreelancerbyId(AppConstants.kUserId),
      );
      return FreelancerModel.fromJson(response);
    });
  }
}
