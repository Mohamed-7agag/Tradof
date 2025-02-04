import 'package:dartz/dartz.dart';
import 'package:tradof/core/api/api_service.dart';
import 'package:tradof/core/errors/failure.dart';

import '../../../../../core/api/end_points.dart';
import '../../../../../core/helpers/handle_request_method.dart';
import 'company_setting_repo.dart';

class CompanySettingRepoImpl implements CompanySettingRepo {
  final ApiServices _apiServices;

  CompanySettingRepoImpl({required ApiServices apiServices})
      : _apiServices = apiServices;
  @override
  Future<Either<Failure, String>> changeCompanyPassword(
      {required String oldPassword, required String newPassword}) {
    return handleRequest(() async {
      final response = await _apiServices.post(
        EndPoint.changeCompanyPassword,
        data: {
          'oldPassword': oldPassword,
          'newPassword': newPassword,
          'confirmPassword': newPassword,
        },
      );
      return response;
    });
  }
}
