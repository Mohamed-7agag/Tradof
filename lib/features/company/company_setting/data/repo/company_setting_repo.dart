import 'package:dartz/dartz.dart';
import 'package:tradof/core/errors/failure.dart';

import '../model/update_company_request_model.dart';

abstract class CompanySettingRepo {
  Future<Either<Failure, String>> changeCompanyPassword({
    required String currentPassword,
    required String newPassword,
  });
  Future<Either<Failure, String>> updateCompanyProfile({
    required UpdateCompanyRequestModel updateCompanyRequestModel,
  });
}
