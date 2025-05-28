import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/errors/exception.dart';
import '../../../../../../core/utils/app_constants.dart';
import '../../../../company_profile/data/model/social_media_model.dart';
import '../../../data/model/freelancer_model.dart';
import '../../../data/repo/freelancer_profile_repo.dart';

part 'freelancer_profile_state.dart';

class FreelancerProfileCubit extends Cubit<FreelancerProfileState> {
  FreelancerProfileCubit(this._freelancerRepo)
      : super(const FreelancerProfileState());
  final FreelancerProfileRepo _freelancerRepo;

  Future<void> getFreelancerProfile({String? freelancerId}) async {
    emit(state.copyWith(status: FreelancerProfileStatus.getFreelancerLoading));
    try {
      final freelancerModel = await _freelancerRepo.getFreelancerProfile(
        freelancerId: freelancerId ?? AppConstants.kUserId,
      );
      emit(state.copyWith(
        status: FreelancerProfileStatus.getFreelancerSuccess,
        freelancerModel: freelancerModel,
      ));
      // Increase profile views only if freelancerId is not null
      if (freelancerId != null) {
        await _freelancerRepo.increaseProfileViews(freelancerId: freelancerId);
      }
    } catch (e) {
      emit(state.copyWith(
        status: FreelancerProfileStatus.getFreelancerFailure,
        errMessage: ServerFailure.fromError(e).errMessage,
      ));
    }
  }

  Future<void> updateSocialMedia({
    required List<SocialMediaModel> socialMedia,
  }) async {
    emit(state.copyWith(
      status: FreelancerProfileStatus.updateSocialMediaLoading,
    ));
    try {
      final result = await _freelancerRepo.updateFreelancerSocialMedia(
        socialList: socialMedia,
      );
      emit(state.copyWith(
        status: FreelancerProfileStatus.updateSocialMediaSuccess,
        message: result,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: FreelancerProfileStatus.updateSocialMediaFailure,
        errMessage: ServerFailure.fromError(e).errMessage,
      ));
    }
  }

  Future<void> uploadCv(PlatformFile cv) async {
    emit(state.copyWith(status: FreelancerProfileStatus.uploadCvLoading));
    try {
      await _freelancerRepo.uploadCv(
        cv: cv,
        freelancerId: AppConstants.kUserId,
        onProgress: (progress) => emit(
          state.copyWith(progress: progress),
        ),
      );
      emit(state.copyWith(
        status: FreelancerProfileStatus.uploadCvSuccess,
        progress: 0,
        message: 'CV Uploaded Successfully',
      ));
    } catch (e) {
      emit(state.copyWith(
        status: FreelancerProfileStatus.uploadCvFailure,
        progress: 0,
        errMessage: ServerFailure.fromError(e).errMessage,
      ));
    }
  }

  Future<void> updateLanguagePairs({
    required List<Map<String, int>> addedLanguagePairsIds,
    required List<int> deletedLanguagePairsIds,
  }) async {
    emit(state.copyWith(status: FreelancerProfileStatus.languagePairLoading));

    try {
      if (addedLanguagePairsIds.isNotEmpty) {
        await _freelancerRepo.addFreelancerLanguagePair(
          languagesPairIds: addedLanguagePairsIds,
        );
      }

      if (deletedLanguagePairsIds.isNotEmpty) {
        await _freelancerRepo.deleteFreelancerLanguagePair(
          languagesPairIds: deletedLanguagePairsIds,
        );
      }
      emit(state.copyWith(
        status: FreelancerProfileStatus.languagePairSuccess,
        message: 'Language Pairs updated successfully',
      ));
    } catch (e) {
      emit(state.copyWith(
        status: FreelancerProfileStatus.languagePairFailure,
        errMessage: ServerFailure.fromError(e).errMessage,
      ));
    }
  }

  Future<void> updateSpecialization({
    required List<int> addedSpecializationIds,
    required List<int> deletedSpecializationIds,
  }) async {
    emit(state.copyWith(status: FreelancerProfileStatus.specializationLoading));

    try {
      if (addedSpecializationIds.isNotEmpty) {
        _freelancerRepo.addSpecialization(
          specializationIds: addedSpecializationIds,
        );
      }

      if (deletedSpecializationIds.isNotEmpty) {
        await _freelancerRepo.deleteSpecialization(
          specializationIds: deletedSpecializationIds,
        );
      }

      emit(state.copyWith(
        status: FreelancerProfileStatus.specializationSuccess,
        message: 'Specialization updated successfully',
      ));
    } catch (e) {
      emit(state.copyWith(
        status: FreelancerProfileStatus.specializationFailure,
        errMessage: ServerFailure.fromError(e).errMessage,
      ));
    }
  }

  Future<void> increaseProfileViews({required String freelancerId}) async {
    try {
      await _freelancerRepo.increaseProfileViews(
        freelancerId: freelancerId,
      );
    } catch (e) {
      //
    }
  }
}
