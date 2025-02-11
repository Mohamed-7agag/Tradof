import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';
import 'package:tradof/core/errors/failure.dart';

import '../../../../company/company_profile/data/model/social_media_model.dart';
import '../model/freelancer_model.dart';

abstract class FreelancerProfileRepo {
  Future<Either<Failure, FreelancerModel>> getFreelancerProfile();
  Future<Either<Failure, String>> updateFreelancerSocialMedia({
    required List<SocialMediaModel> socialList,
  });
  Future<Either<Failure, Unit>> uploadCv({
    required String freelancerId,
    required PlatformFile cv,
  });
}
