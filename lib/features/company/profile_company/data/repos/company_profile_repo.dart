import 'package:dartz/dartz.dart';
import 'package:tradof/core/errors/failure.dart';
import 'package:tradof/features/auth/data/model/language_model.dart';
import 'package:tradof/features/auth/data/model/specialization_model.dart';
import 'package:tradof/features/company/profile_company/data/model/company_update_request_model.dart';

import '../model/company_model.dart';

abstract class CompanyProfileRepo {
  Future<Either<Failure, CompanyModel>> getCompanyProfrile({
    required String companyId,
  });

  Future<Either<Failure, String>> addPreferedLanguages({
    required LanguageModel languageModel,
  });
  Future<Either<Failure, String>> deletePreferedLanguages({
    required LanguageModel languageModel,
  });

  Future<Either<Failure, SpecializationModel>> addIndustriesServed({
    required SpecializationModel specializationModel,
  });
  Future<Either<Failure, String>> deleteIndustriesServed({
    required SpecializationModel specializationModel,
  });

  Future<Either<Failure, String>> updateCompanyProfile({
    required CompanyUpdateRequestModel companyUpdateRequestModel,
  });
}
