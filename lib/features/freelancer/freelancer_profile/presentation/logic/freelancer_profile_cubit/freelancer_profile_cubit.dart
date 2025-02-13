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

  Future<void> updateLanguagePairs({
    required List<Map<String, int>> addedLanguagePairsIds,
    required List<Map<String, int>> deletedLanguagePairsIds,
  }) async {
    emit(state.copyWith(status: FreelancerProfileStatus.languagePairLoading));

    try {
      if (addedLanguagePairsIds.isNotEmpty) {
        final addResult = await _freelancerRepo.addFreelancerLanguagePair(
            freelancerId: AppConstants.kUserId,
            languagesPairIds: addedLanguagePairsIds);
        addResult.fold(
          (failure) => emit(
            state.copyWith(
              status: FreelancerProfileStatus.languagePairFailure,
              errMessage: failure.errMessage,
            ),
          ),
          (_) => {},
        );
      }

      if (deletedLanguagePairsIds.isNotEmpty) {
        final deleteResult = await _freelancerRepo.deleteFreelancerLanguagePair(
          freelancerId: AppConstants.kUserId,
          languagesPairIds: deletedLanguagePairsIds,
        );
        deleteResult.fold(
          (failure) => emit(
            state.copyWith(
              status: FreelancerProfileStatus.languagePairFailure,
              errMessage: failure.errMessage,
            ),
          ),
          (_) => {},
        );
      }
      if (!state.status.isLanguagePairFailure) {
        emit(state.copyWith(
          status: FreelancerProfileStatus.languagePairSuccess,
          message: 'Language Pairs updated successfully',
        ));
      }
    } catch (e) {
      emit(
        state.copyWith(
          status: FreelancerProfileStatus.languagePairFailure,
          errMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> updateSpecialization({
    required List<int> addedSpecializationIds,
    required List<int> deletedSpecializationIds,
  }) async {
    emit(state.copyWith(status: FreelancerProfileStatus.specializationLoading));

    try {
      if (addedSpecializationIds.isNotEmpty) {
        final addResult = await _freelancerRepo.addSpecialization(
          specializationIds: addedSpecializationIds,
        );
        addResult.fold(
          (failure) => emit(
            state.copyWith(
              status: FreelancerProfileStatus.specializationFailure,
              errMessage: failure.errMessage,
            ),
          ),
          (_) => {},
        );
      }

      if (deletedSpecializationIds.isNotEmpty) {
        final deleteResult = await _freelancerRepo.deleteSpecialization(
          specializationIds: deletedSpecializationIds,
        );
        deleteResult.fold(
          (failure) => emit(
            state.copyWith(
              status: FreelancerProfileStatus.specializationFailure,
              errMessage: failure.errMessage,
            ),
          ),
          (_) => {},
        );
      }

      if (!state.status.isUpdateSocialMediaFailure) {
        emit(state.copyWith(
          status: FreelancerProfileStatus.specializationSuccess,
          message: 'Specialization updated successfully',
        ));
      }
    } catch (e) {
      emit(
        state.copyWith(
          status: FreelancerProfileStatus.specializationFailure,
          errMessage: e.toString(),
        ),
      );
    }
  }
}
