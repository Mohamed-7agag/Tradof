import 'package:dartz/dartz.dart';
import 'package:tradof/core/errors/failure.dart';

import '../model/freelancer_model.dart';

abstract class FreelancerRepo {
  Future<Either<Failure, FreelancerModel>> getFreelancerProfile();
}
