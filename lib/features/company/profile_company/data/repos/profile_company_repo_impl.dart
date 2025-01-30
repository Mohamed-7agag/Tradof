import 'package:dartz/dartz.dart';
import 'package:tradof/core/api/api_service.dart';
import 'package:tradof/core/api/end_points.dart';
import 'package:tradof/core/errors/failure.dart';
import 'package:tradof/core/helpers/handle_request_method.dart';
import 'package:tradof/features/auth/data/model/language_model.dart';
import 'package:tradof/features/auth/data/model/specialization_model.dart';
import 'package:tradof/features/company/profile_company/data/repos/profile_company_repo.dart';

class ProfileCompanyRepoImpl implements ProfileCompanyRepo {
  final ApiServices _apiServices;

  ProfileCompanyRepoImpl({required ApiServices apiServices})
      : _apiServices = apiServices;
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
