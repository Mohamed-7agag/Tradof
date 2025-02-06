import 'package:dartz/dartz.dart';
import 'package:tradof/core/api/api_service.dart';
import 'package:tradof/core/api/end_points.dart';
import 'package:tradof/core/errors/failure.dart';
import 'package:tradof/core/helpers/handle_request_method.dart';
import 'package:tradof/core/utils/app_constants.dart';

import '../model/company_employee_model.dart';
import '../model/company_employee_request_model.dart';
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
  Future<Either<Failure, List<CompanyEmployeeModel>>> getCompanyEmployees(
      {required String companyId}) {
    return handleRequest(() async {
      final response = await _apiServices.get(
        EndPoint.getCompanyEmployees(companyId),
      );
      return List<CompanyEmployeeModel>.from(
        response.map<CompanyEmployeeModel>(
          (employee) => CompanyEmployeeModel.fromJson(employee),
        ),
      );
    });
  }

  @override
  Future<Either<Failure, String>> addCompanyEmployee(
      {required CompanyEmployeeRequestModel employeeModel}) {
    return handleRequest(() async {
      final response = await _apiServices.post(
        EndPoint.addCompanyEmployee,
        data: employeeModel.toJson(),
      );
      return response;
    });
  }

  @override
  Future<Either<Failure, String>> addPreferedLanguages(
      {required List<int> languagesIds}) {
    return handleRequest(() async {
      final response = await _apiServices.post(
        EndPoint.addPreferredLanguage(AppConstants.kUserId),
        data: languagesIds,
      );
      return response;
    });
  }

  @override
  Future<Either<Failure, String>> deletePreferedLanguages(
      {required List<int> languagesIds}) {
    return handleRequest(() async {
      final response = await _apiServices.delete(
        EndPoint.deletePreferredLanguage(AppConstants.kUserId),
        data: languagesIds,
      );
      return response;
    });
  }

  @override
  Future<Either<Failure, String>> addIndustriesServed(
      {required List<int> industriesIds}) {
    return handleRequest(() async {
      final response = await _apiServices.post(
        EndPoint.addIndustries(AppConstants.kUserId),
        data: industriesIds,
      );
      return response;
    });
  }

  @override
  Future<Either<Failure, String>> deleteIndustriesServed(
      {required List<int> industriesIds}) {
    return handleRequest(() async {
      final response = await _apiServices.delete(
        EndPoint.deleteIndustries(AppConstants.kUserId),
        data: industriesIds,
      );
      return response;
    });
  }
}
