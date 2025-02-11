import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradof/core/utils/app_constants.dart';

import '../../../../../company/company_profile/data/model/social_media_model.dart';
import '../../../data/model/freelancer_model.dart';
import '../../../data/repo/freelancer_profile_repo.dart';

part 'freelancer_profile_state.dart';

class FreelancerProfileCubit extends Cubit<FreelancerProfileState> {
  FreelancerProfileCubit(this._freelancerRepo)
      : super(const FreelancerProfileState());
  final FreelancerProfileRepo _freelancerRepo;

  Future<void> getFreelancerProfile() async {
    emit(state.copyWith(status: FreelancerProfileStatus.getFreelancerLoading));
    final result = await _freelancerRepo.getFreelancerProfile();
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: FreelancerProfileStatus.getFreelancerFailure,
          errMessage: failure.errMessage,
        ),
      ),
      (freelancerModel) => emit(
        state.copyWith(
          status: FreelancerProfileStatus.getFreelancerSuccess,
          freelancerModel: freelancerModel,
        ),
      ),
    );
  }

  Future<void> updateSocialMedia({
    required List<SocialMediaModel> socialMedia,
  }) async {
    emit(state.copyWith(
        status: FreelancerProfileStatus.updateSocialMediaLoading));
    final result = await _freelancerRepo.updateFreelancerSocialMedia(
      socialList: socialMedia,
    );
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: FreelancerProfileStatus.updateSocialMediaFailure,
          errMessage: failure.errMessage,
        ),
      ),
      (message) => emit(state.copyWith(
        status: FreelancerProfileStatus.updateSocialMediaSuccess,
        message: message,
        errMessage: null,
      )),
    );
  }

  Future<void> uploadCv(PlatformFile cv) async {
    emit(state.copyWith(status: FreelancerProfileStatus.uploadCvLoading));
    final result = await _freelancerRepo.uploadCv(
      cv: cv,
      freelancerId: AppConstants.kUserId,
    );
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: FreelancerProfileStatus.uploadCvFailure,
          errMessage: failure.errMessage,
        ),
      ),
      (message) => emit(state.copyWith(
        status: FreelancerProfileStatus.uploadCvSuccess,
        message: 'Cv Uploaded Successfully',
        errMessage: null,
      )),
    );
  }
}
