import 'package:dartz/dartz.dart';
import 'package:tradof/core/api/api_service.dart';
import 'package:tradof/core/api/end_points.dart';
import 'package:tradof/core/errors/failure.dart';
import 'package:tradof/core/helpers/handle_request_method.dart';
import 'package:tradof/features/auth/data/model/language_model.dart';
import 'package:tradof/features/auth/data/model/specialization_model.dart';
import 'package:tradof/features/company/profile_company/data/model/company_model.dart';
import 'package:tradof/features/company/profile_company/data/repos/profile_company_repo.dart';

class ProfileCompanyRepoImpl implements ProfileCompanyRepo {
  final ApiServices _apiServices;

  ProfileCompanyRepoImpl({required ApiServices apiServices})
      : _apiServices = apiServices;
 

  @override
  Future<Either<Failure, SpecializationModel>> addIndustriesService(
      {required SpecializationModel specializationModel}) {
    // TODO: implement addIndustriesService
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, LanguageModel>> addPreferedLanguages(
      {required LanguageModel languageModel}) {
    // TODO: implement addPreferedLanguages
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> deleteIndustriesService(
      {required SpecializationModel specializationModel}) {
    // TODO: implement deleteIndustriesService
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> deletePreferedLanguages(
      {required LanguageModel languageModel}) {
    // TODO: implement deletePreferedLanguages
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, CompanyModel>> getCompanyProfrile({required String id}) async {
    return handleRequest(() async {
      final response = await _apiServices.get(
        EndPoint.getCompanybyId(id),
      );
      return response;
    });
  }
}
