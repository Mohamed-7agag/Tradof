import 'package:dartz/dartz.dart';
import 'package:tradof/core/errors/failure.dart';

import '../model/company_model.dart';


abstract class CompanyProfileRepo {
  Future<Either<Failure, CompanyModel>> getCompanyProfrile({
    required String companyId,
  });

  Future<Either<Failure, String>> addPreferedLanguages({
    required List<int> languagesIds,
  });
  Future<Either<Failure, String>> deletePreferedLanguages({
    required List<int> languagesIds,
  });

  Future<Either<Failure, String>> addIndustriesServed({
    required List<int> industriesIds,
  });
  Future<Either<Failure, String>> deleteIndustriesServed({
    required List<int> industriesIds,
  });
}
