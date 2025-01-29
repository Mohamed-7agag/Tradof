import 'package:dartz/dartz.dart';
import 'package:tradof/core/api/end_points.dart';
import 'package:tradof/core/errors/failure.dart';
import 'package:tradof/features/auth/data/model/language_model.dart';
import 'package:tradof/features/auth/data/model/specialization_model.dart';

import '../../../../core/api/api_service.dart';
import '../../../../core/helpers/handle_request_method.dart';
import '../model/company_register_request_model.dart';
import '../model/country_model.dart';
import '../model/freelancer_register_request_model.dart';
import 'registeration_repo.dart';

class RegisterationRepoImpl implements RegisterationRepo {
  final ApiServices _apiServices;

  RegisterationRepoImpl({required ApiServices apiServices})
      : _apiServices = apiServices;
  @override
  Future<Either<Failure, String>> freelancerRegister(
      FreelancerRegisterRequestModel freelancerRegisterRequestModel) {
    return handleRequest(() async {
      final response = await _apiServices.post(
        EndPoint.registerFreelancer,
        data: freelancerRegisterRequestModel.toJson(),
      );
      return response; // or parse the response
    });
  }

  @override
  Future<Either<Failure, String>> companyRegister(
      CompanyRegisterRequestModel companyRegisterRequestModel) {
    return handleRequest(() async {
      final response = await _apiServices.post(
        EndPoint.registerCompany,
        data: companyRegisterRequestModel.toJson(),
      );
      return response;
    });
  }

  @override
  Future<Either<Failure, List<CountryModel>>> getCountries() {
    return handleRequest(() async {
      final response = await _apiServices.get(
        EndPoint.getCountries,
      );
      List<CountryModel> countries = List<CountryModel>.from(
        response.map((country) => CountryModel.fromJson(country)),
      );
      return countries;
    });
  }

  @override
  Future<Either<Failure, List<LanguageModel>>> getLanguages() {
    return handleRequest(() async {
      final response = await _apiServices.get(
        EndPoint.getLanguages,
      );
      List<LanguageModel> languages = List<LanguageModel>.from(
        response.map((language) => LanguageModel.fromJson(language)),
      );
      return languages;
    });
  }

  @override
  Future<Either<Failure, List<SpecializationModel>>> getSpecaialization() {
    return handleRequest(() async {
      final response = await _apiServices.get(
        EndPoint.getSpecializations,
      );
      List<SpecializationModel> specializations =
          List<SpecializationModel>.from(response.map(
        (specialization) => SpecializationModel.fromJson(specialization),
      ));
      return specializations;
    });
  }
}
