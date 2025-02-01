import 'package:dartz/dartz.dart';
import 'package:tradof/core/api/api_service.dart';
import 'package:tradof/core/api/end_points.dart';
import 'package:tradof/core/errors/failure.dart';
import 'package:tradof/core/helpers/handle_request_method.dart';
import 'package:tradof/features/auth/data/model/language_model.dart';
import 'package:tradof/features/auth/data/model/specialization_model.dart';
import 'package:tradof/features/company/profile_company/data/repos/profile_company_repo.dart';

import '../../../../../core/cache/cache_helper.dart';
import '../../../../../core/utils/app_constants.dart';
import '../model/company_model.dart';

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

  @override
  Future<Either<Failure, String>> addPreferedLanguages(
      {required LanguageModel languageModel}) async {
    return handleRequest(() async {
      final response = await _apiServices.post(
        EndPoint.addPreferredLanguage(
            await CacheHelper.getSecuredString(AppConstants.userId),
            languageModel.id.toString()),
        data: {
          'languageId': languageModel.id,
        },
      );
      return response['message'] ?? 'Language added successfully';
    });
  }

  @override
  Future<Either<Failure, String>> deleteIndustriesService(
      {required SpecializationModel specializationModel}) {
    // TODO: implement deleteIndustriesService
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> deletePreferedLanguages(
      {required LanguageModel languageModel}) async {
    return handleRequest(() async {
      final response = await _apiServices.delete(
        EndPoint.deletePreferredLanguage(
            await CacheHelper.getSecuredString(AppConstants.userId),
            languageModel.id.toString()),
      );
      return response['message'] ?? 'Language deleted successfully';
    });
  }

  @override
  Future<Either<Failure, CompanyModel>> getCompanyProfrile(
      {required String id}) async {
    return handleRequest(() async {
      final response = await _apiServices.get(
        EndPoint.getCompanybyId(id),
      );
      return CompanyModel.fromJson(response);
    });
  }

  @override
  Future<Either<Failure, SpecializationModel>> addIndustriesService(
      {required SpecializationModel specializationModel}) {
    // TODO: implement addIndustriesService
    throw UnimplementedError();
  }
}
