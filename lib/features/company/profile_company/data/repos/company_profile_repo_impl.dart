import 'package:dartz/dartz.dart';
import 'package:tradof/core/api/api_service.dart';
import 'package:tradof/core/api/end_points.dart';
import 'package:tradof/core/errors/failure.dart';
import 'package:tradof/core/helpers/handle_request_method.dart';
import 'package:tradof/core/utils/app_constants.dart';
import 'package:tradof/features/auth/data/model/language_model.dart';

import '../../../../auth/data/model/specialization_model.dart';
import '../model/company_model.dart';
import 'company_profile_repo.dart';

class CompanyProfileRepoImpl implements CompanyProfileRepo {
  final ApiServices _apiServices;

  CompanyProfileRepoImpl({required ApiServices apiServices})
      : _apiServices = apiServices;

  @override
  Future<Either<Failure, CompanyModel>> getCompanyProfrile(
      {required String companyId}) {
    return handleRequest(() async {
      final response = await _apiServices.get(
        EndPoint.getCompanybyId(companyId),
      );
      return CompanyModel.fromJson(response);
    });
  }

  @override
  Future<Either<Failure, String>> addPreferedLanguages({required int id}) {
    return handleRequest(() async {
      final response = await _apiServices.post(
        EndPoint.addPreferredLanguage(AppConstants.kUserId, id),
      );
      return response['message'] ?? 'Language added successfully';
    });
  }

  @override
  Future<Either<Failure, String>> deletePreferedLanguages(
      {required LanguageModel languageModel}) {
    return handleRequest(() async {
      final response = await _apiServices.delete(
        EndPoint.deletePreferredLanguage(
          AppConstants.kUserId,
          languageModel.id,
        ),
      );
      return response['message'] ?? 'Language deleted successfully';
    });
  }

  @override
  Future<Either<Failure, SpecializationModel>> addIndustriesServed(
      {required SpecializationModel specializationModel}) {
    // TODO: implement addIndustriesService
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> deleteIndustriesServed(
      {required SpecializationModel specializationModel}) {
    // TODO: implement deleteIndustriesService
    throw UnimplementedError();
  }
}
