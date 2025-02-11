import 'package:dartz/dartz.dart';
import 'package:tradof/core/errors/failure.dart';

abstract class FreelancerSettingRepo {
  Future<Either<Failure, String>> changeFreelancerPassword({
    required String currentPassword,
    required String newPassword,
  });
}
