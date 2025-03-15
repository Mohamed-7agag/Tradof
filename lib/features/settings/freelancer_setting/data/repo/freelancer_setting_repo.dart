import '../../../model/update_freelancer_request_model.dart';

abstract class FreelancerSettingRepo {
  Future<void> changeFreelancerPassword({
    required String currentPassword,
    required String newPassword,
  });
  Future<void> updateFreelancerProfile({
    required UpdateFreelancerRequestModel updateFreelancerRequestModel,
  });
}
