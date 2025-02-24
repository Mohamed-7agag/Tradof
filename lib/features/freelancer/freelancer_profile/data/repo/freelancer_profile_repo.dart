import 'package:file_picker/file_picker.dart';

import '../../../../company/company_profile/data/model/social_media_model.dart';
import '../model/freelancer_model.dart';

abstract class FreelancerProfileRepo {
  Future<FreelancerModel> getFreelancerProfile();
  Future<String> updateFreelancerSocialMedia({
    required List<SocialMediaModel> socialList,
  });
  Future<void> uploadCv({
    required String freelancerId,
    required PlatformFile cv,
     required Function(double) onProgress,
  });
  Future<void> addFreelancerLanguagePair({
    required List<Map<String, int>> languagesPairIds,
  });
  Future<void> deleteFreelancerLanguagePair({
    required List<int> languagesPairIds,
  });

  Future<void> addSpecialization({
    required List<int> specializationIds,
  });
  Future<void> deleteSpecialization({
    required List<int> specializationIds,
  });
}
