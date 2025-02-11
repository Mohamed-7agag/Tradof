import 'package:dartz/dartz.dart';
import 'package:tradof/core/errors/failure.dart';

import '../model/update_freelancer_request_model.dart';

abstract class FreelancerSettingRepo {
  Future<Either<Failure, String>> changeFreelancerPassword({
    required String currentPassword,
    required String newPassword,
  });
  Future<Either<Failure, String>> updateCompanyProfile({
    required UpdateFreelancerRequestModel updateFreelancerRequestModel,
  });
}
