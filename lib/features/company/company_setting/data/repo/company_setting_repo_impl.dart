import 'package:dartz/dartz.dart';
import 'package:tradof/core/api/api_service.dart';
import 'package:tradof/core/errors/failure.dart';
import 'package:tradof/features/company/company_setting/data/model/social_media_model.dart';

import '../../../../../core/api/end_points.dart';
import '../../../../../core/helpers/handle_request_method.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../company_profile/data/model/company_update_request_model.dart';
import 'company_setting_repo.dart';

class CompanySettingRepoImpl implements CompanySettingRepo {
  final ApiServices _apiServices;

  CompanySettingRepoImpl({required ApiServices apiServices})
      : _apiServices = apiServices;
  @override
  Future<Either<Failure, String>> changeCompanyPassword(
      {required String currentPassword, required String newPassword}) {
    return handleRequest(() async {
      final response = await _apiServices.put(
        EndPoint.changeCompanyPassword(AppConstants.kUserId),
        data: {
          'currentPassword': currentPassword,
          'newPassword': newPassword,
          'confirmPassword': newPassword,
        },
      );
      return response;
    });
  }

  @override
  Future<Either<Failure, String>> updateCompanyProfile(
      {required UpdateCompanyRequestModel updateCompanyRequestModel}) {
    return handleRequest(() async {
      final response = await _apiServices.put(
        EndPoint.updateCompanyProfile,
        data: updateCompanyRequestModel.toJson(),
      );
      return response;
    });
  }

  @override
  Future<Either<Failure, String>> addUpdateSocialMedia({required List<SocialMediaModel> socialMediaModel}) {
    return handleRequest(() async {
      final response = await _apiServices.post(
        EndPoint.addUpateSocialMedia(AppConstants.kUserId),
        data: socialMediaModel.map((e) => e.toJson()).toList(),
      );
      return response;
    });
  }
}
