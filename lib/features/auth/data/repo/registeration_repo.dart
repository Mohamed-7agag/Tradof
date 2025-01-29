import 'package:dartz/dartz.dart';
import 'package:tradof/core/errors/failure.dart';

abstract class RegisterationRepo {
  Future<Either<Failure, String>> freelancerRegister();
  Future<Either<Failure, String>> companyRegister();
  Future<Either<Failure, String>> getCountries();
}
