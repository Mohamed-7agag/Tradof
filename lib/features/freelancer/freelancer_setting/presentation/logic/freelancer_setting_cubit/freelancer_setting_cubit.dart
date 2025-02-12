import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradof/core/helpers/extensions.dart';

import '../../../../../../core/utils/widgets/upload_image_to_cloudinary.dart';
import '../../../../freelancer_profile/data/model/freelancer_model.dart';
import '../../../data/model/update_freelancer_request_model.dart';
import '../../../data/repo/freelancer_setting_repo.dart';

part 'freelancer_setting_state.dart';

class FreelancerSettingCubit extends Cubit<FreelancerSettingState> {
  FreelancerSettingCubit(this._freelancerSettingRepo)
      : super(FreelancerSettingState());
  final FreelancerSettingRepo _freelancerSettingRepo;
  Future<void> changeCompanyPassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    emit(state.copyWith(status: FreelancerSettingStatus.changePasswordLoading));
    final result = await _freelancerSettingRepo.changeFreelancerPassword(
      currentPassword: currentPassword,
      newPassword: newPassword,
    );
    result.fold((failure) {
      emit(state.copyWith(
        status: FreelancerSettingStatus.changePasswordFailure,
        errMessage: failure.errMessage,
      ));
    }, (message) {
      emit(state.copyWith(
        status: FreelancerSettingStatus.changePasswordSuccess,
        message: 'Password Changed Successfully',
      ));
    });
  }

  void setImageProfileAndCountryId({int? countryId, File? image}) {
    emit(state.copyWith(countryId: countryId, imagePicked: image));
  }

  Future<void> updateFreelancerProfile(
    String firstName,
    String lastName,
    String email,
    String phoneNumber,
    FreelancerModel freelancerModel,
  ) async {
    emit(state.copyWith(
        status: FreelancerSettingStatus.updateFreelancerProfileLoading));
    final updateFreelancerRequestModel =
        await _buildUpdateFreelancerRequestModel(
      firstName: firstName,
      lastName: lastName,
      email: email,
      phoneNumber: phoneNumber,
      freelancerModel: freelancerModel,
    );
    final result = await _freelancerSettingRepo.updateCompanyProfile(
      updateFreelancerRequestModel: updateFreelancerRequestModel,
    );
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: FreelancerSettingStatus.updateFreelancerProfileFailure,
          errMessage: failure.errMessage,
        ),
      ),
      (message) => emit(
        state.copyWith(
          status: FreelancerSettingStatus.updateFreelancerProfileSuccess,
          message: 'Profile Changed Successfully',
          errMessage: null,
        ),
      ),
    );
  }

  Future<UpdateFreelancerRequestModel> _buildUpdateFreelancerRequestModel({
    required String firstName,
    required String lastName,
    required String email,
    required String phoneNumber,
    required FreelancerModel freelancerModel,
  }) async {
    String? imageUrl;
    if (state.imagePicked != null) {
      imageUrl = await uploadImageToCloudinary(state.imagePicked!);
    }

    return UpdateFreelancerRequestModel(
      firstName:
          firstName.isNullOrEmpty() ? freelancerModel.firstName : firstName,
      lastName: lastName.isNullOrEmpty() ? freelancerModel.lastName : lastName,
      email: email.isNullOrEmpty() ? freelancerModel.email : email,
      phoneNumber:
          phoneNumber.isNullOrEmpty() ? freelancerModel.phone : phoneNumber,
      profileImageUrl: imageUrl ?? freelancerModel.profileImageUrl,
      countryId: state.countryId ?? freelancerModel.countryId,
    );
  }
}
