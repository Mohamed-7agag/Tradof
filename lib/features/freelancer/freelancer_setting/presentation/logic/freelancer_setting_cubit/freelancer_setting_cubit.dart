import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradof/core/errors/exception.dart';

import '../../../../../../core/utils/widgets/upload_image_to_cloudinary.dart';
import '../../../../freelancer_profile/data/model/freelancer_model.dart';
import '../../../data/model/update_freelancer_request_model.dart';
import '../../../data/repo/freelancer_setting_repo.dart';

part 'freelancer_setting_state.dart';

class FreelancerSettingCubit extends Cubit<FreelancerSettingState> {
  FreelancerSettingCubit(this._freelancerSettingRepo)
      : super(const FreelancerSettingState());
  final FreelancerSettingRepo _freelancerSettingRepo;

  Future<void> changeCompanyPassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    emit(state.copyWith(status: FreelancerSettingStatus.changePasswordLoading));

    try {
      await _freelancerSettingRepo.changeFreelancerPassword(
        currentPassword: currentPassword,
        newPassword: newPassword,
      );
      emit(state.copyWith(
        status: FreelancerSettingStatus.changePasswordSuccess,
        message: 'Password Changed Successfully',
      ));
    } catch (e) {
      emit(state.copyWith(
        status: FreelancerSettingStatus.changePasswordFailure,
        errMessage: ServerFailure.fromError(e).errMessage,
      ));
    }
  }

  void setImageProfileAndCountryId({int? countryId, File? image}) {
    emit(state.copyWith(countryId: countryId, imagePicked: image));
  }

  Future<void> updateFreelancerProfile(
    String firstName,
    String lastName,
    String phoneNumber,
    FreelancerModel freelancerModel,
  ) async {
    emit(state.copyWith(
        status: FreelancerSettingStatus.updateFreelancerProfileLoading));
    try {
      final updateFreelancerRequestModel =
          await _buildUpdateFreelancerRequestModel(
        firstName: firstName,
        lastName: lastName,
        phoneNumber: phoneNumber,
        freelancerModel: freelancerModel,
      );
      await _freelancerSettingRepo.updateCompanyProfile(
        updateFreelancerRequestModel: updateFreelancerRequestModel,
      );
      emit(state.copyWith(
        status: FreelancerSettingStatus.updateFreelancerProfileSuccess,
        message: 'Profile Changed Successfully',
      ));
    } catch (e) {
      emit(state.copyWith(
        status: FreelancerSettingStatus.updateFreelancerProfileFailure,
        errMessage: ServerFailure.fromError(e).errMessage,
      ));
    }
  }

  Future<UpdateFreelancerRequestModel> _buildUpdateFreelancerRequestModel({
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required FreelancerModel freelancerModel,
  }) async {
    String? imageUrl;
    if (state.imagePicked != null) {
      imageUrl = await uploadImageToCloudinary(state.imagePicked);
    }

    return UpdateFreelancerRequestModel(
      firstName: firstName.isEmpty ? freelancerModel.firstName : firstName,
      lastName: lastName.isEmpty ? freelancerModel.lastName : lastName,
      email: freelancerModel.email,
      phoneNumber: phoneNumber.isEmpty ? freelancerModel.phone : phoneNumber,
      profileImageUrl: imageUrl ?? freelancerModel.profileImageUrl,
      countryId: state.countryId ?? freelancerModel.countryId,
    );
  }
}
