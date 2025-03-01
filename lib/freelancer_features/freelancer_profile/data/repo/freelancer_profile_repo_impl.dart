import 'package:file_picker/file_picker.dart';

import '../../../../company_features/company_profile/data/model/social_media_model.dart';
import '../../../../core/api/api_service.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/helpers/upload_file_to_api.dart';
import '../../../../core/utils/app_constants.dart';
import '../model/freelancer_model.dart';
import 'freelancer_profile_repo.dart';

class FreelancerProfileRepoImpl implements FreelancerProfileRepo {
  FreelancerProfileRepoImpl({required ApiServices apiServices})
      : _apiServices = apiServices;
  final ApiServices _apiServices;

  @override
  Future<FreelancerModel> getFreelancerProfile(
      {required String freelancerId}) async {
    final response = await _apiServices.get(
      EndPoint.getFreelancerById(freelancerId),
    );
    return FreelancerModel.fromJson(response);
  }

  @override
  Future<String> updateFreelancerSocialMedia(
      {required List<SocialMediaModel> socialList}) async {
    final response = await _apiServices.post(
      EndPoint.freelancerSocialMediaCRUD(AppConstants.kUserId),
      data: socialList.map((e) => e.toJson()).toList(),
    );
    return response;
  }

  @override
  Future<void> uploadCv({
    required String freelancerId,
    required PlatformFile cv,
    required Function(double) onProgress,
  }) async {
    await _apiServices.post(
      EndPoint.uploadCv(AppConstants.kUserId),
      data: {'file': await uploadFileToApi(cv)},
      onSendProgress: (send, total) => onProgress(send / total),
      isFormData: true,
    );
  }

  @override
  Future<void> addFreelancerLanguagePair({
    required List<Map<String, int>> languagesPairIds,
  }) async {
    await _apiServices.post(
      EndPoint.addOrDeleteFreelancerLanguagePair(AppConstants.kUserId),
      data: languagesPairIds,
    );
  }

  @override
  Future<void> deleteFreelancerLanguagePair({
    required List<int> languagesPairIds,
  }) async {
    await _apiServices.delete(
      EndPoint.addOrDeleteFreelancerLanguagePair(AppConstants.kUserId),
      data: languagesPairIds,
    );
  }

  @override
  Future<void> addSpecialization({required List<int> specializationIds}) async {
    await _apiServices.post(
      EndPoint.addSpecialization(AppConstants.kUserId),
      data: specializationIds,
    );
  }

  @override
  Future<void> deleteSpecialization(
      {required List<int> specializationIds}) async {
    await _apiServices.delete(
      EndPoint.deleteSpecialization(AppConstants.kUserId),
      data: specializationIds,
    );
  }
}
