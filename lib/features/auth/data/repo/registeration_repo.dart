import 'package:dartz/dartz.dart';
import 'package:tradof/core/errors/failure.dart';
import 'package:tradof/features/auth/data/model/country_model.dart';
import 'package:tradof/features/auth/data/model/freelancer_register_request_model.dart';
import 'package:tradof/features/auth/data/model/language_model.dart';
import 'package:tradof/features/auth/data/model/specialization_model.dart';

import '../model/company_register_request_model.dart';

abstract class RegisterationRepo {
  Future<Either<Failure, String>> freelancerRegister(
    FreelancerRegisterRequestModel freelancerRegisterRequestModel,
  );
  Future<Either<Failure, String>> companyRegister(
    CompanyRegisterRequestModel companyRegisterRequestModel,
  );
  Future<Either<Failure, List<CountryModel>>> getCountries();
  Future<Either<Failure, List<LanguageModel>>> getLanguages();
  Future<Either<Failure, List<SpecializationModel>>> getSpecaialization();
}
