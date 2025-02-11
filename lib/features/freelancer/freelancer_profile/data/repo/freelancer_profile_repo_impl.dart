import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';
import 'package:tradof/core/api/api_service.dart';
import 'package:tradof/core/errors/failure.dart';
import 'package:tradof/core/helpers/upload_file_to_api.dart';
import 'package:tradof/core/utils/app_constants.dart';
import 'package:tradof/features/company/company_profile/data/model/social_media_model.dart';

import '../../../../../core/api/end_points.dart';
import '../../../../../core/helpers/handle_request_method.dart';
import '../model/freelancer_model.dart';
import 'freelancer_profile_repo.dart';

class FreelancerProfileRepoImpl implements FreelancerProfileRepo {
  final ApiServices _apiServices;

  FreelancerProfileRepoImpl({required ApiServices apiServices})
      : _apiServices = apiServices;
  @override
  Future<Either<Failure, FreelancerModel>> getFreelancerProfile() {
    return handleRequest(() async {
      final response = await _apiServices.get(
        EndPoint.getFreelancerbyId(AppConstants.kUserId),
      );
      return FreelancerModel.fromJson(response);
    });
  }

  @override
  Future<Either<Failure, String>> updateFreelancerSocialMedia(
      {required List<SocialMediaModel> socialList}) {
    return handleRequest(() async {
      final response = await _apiServices.post(
        EndPoint.freelancerSocialMediaCRUD(AppConstants.kUserId),
        data: socialList.map((e) => e.toJson()).toList(),
      );
      return response;
    });
  }

  @override
  Future<Either<Failure, Unit>> uploadCv(
      {required String freelancerId, required PlatformFile cv}) {
    return handleRequest(() async {
      await _apiServices.post(
        EndPoint.uploadCv(AppConstants.kUserId),
        data: {'file': await uploadFileToApi(cv)},
        isFormData: true,
      );
      return unit;
    });
  }
}
