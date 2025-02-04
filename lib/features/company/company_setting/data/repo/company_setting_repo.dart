import 'package:dartz/dartz.dart';
import 'package:tradof/core/errors/failure.dart';

abstract class CompanySettingRepo {
  Future<Either<Failure, String>> changeCompanyPassword({
    required String oldPassword,
    required String newPassword,
  });
}
