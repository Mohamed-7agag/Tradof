import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradof/core/helpers/extensions.dart';

import '../../../../../../core/utils/app_constants.dart';
import '../../../../../../core/utils/widgets/upload_image_to_cloudinary.dart';
import '../../../../company_profile/data/model/company_model.dart';
import '../../../data/model/update_company_request_model.dart';
import '../../../data/repo/company_setting_repo.dart';

part 'company_setting_state.dart';

class CompanySettingCubit extends Cubit<CompanySettingState> {
  CompanySettingCubit(this._companySettingRepo)
      : super(const CompanySettingState());

  final CompanySettingRepo _companySettingRepo;

  Future<void> changeCompanyPassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    emit(state.copyWith(status: CompanySettingStatus.changePasswordLoading));
    final result = await _companySettingRepo.changeCompanyPassword(
      currentPassword: currentPassword,
      newPassword: newPassword,
    );
    result.fold((failure) {
      emit(state.copyWith(
        status: CompanySettingStatus.changePasswordFailure,
        errMessage: failure.errMessage,
      ));
    }, (message) {
      emit(state.copyWith(
        status: CompanySettingStatus.changePasswordSuccess,
        message: 'Password Changed Successfully',
      ));
    });
  }

  void setImageProfileAndCountryId({int? countryId, File? image}) {
    emit(state.copyWith(countryId: countryId, imagePicked: image));
  }

  Future<void> updateCompanyProfile(
    String firstName,
    String lastName,
    String email,
    String companyName,
    String location,
    String phoneNumber,
    CompanyModel companyModel,
  ) async {
    emit(state.copyWith(
        status: CompanySettingStatus.updateCompanyProfileLoading));
    final updateCompanyRequestModel = await _buildUpdateCompanyRequestModel(
      firstName: firstName,
      lastName: lastName,
      email: email,
      companyName: companyName,
      location: location,
      phoneNumber: phoneNumber,
      companyModel: companyModel,
    );
    final result = await _companySettingRepo.updateCompanyProfile(
      updateCompanyRequestModel: updateCompanyRequestModel,
    );
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: CompanySettingStatus.updateCompanyProfileFailure,
          errMessage: failure.errMessage,
        ),
      ),
      (message) => emit(
        state.copyWith(
          status: CompanySettingStatus.updateCompanyProfileSuccess,
          message: 'Profile Updated Successfully',
          errMessage: null,
        ),
      ),
    );
  }

  Future<UpdateCompanyRequestModel> _buildUpdateCompanyRequestModel({
    required String firstName,
    required String lastName,
    required String email,
    required String companyName,
    required String location,
    required String phoneNumber,
    required CompanyModel companyModel,
  }) async {
    String? imageUrl;
    if (state.imagePicked != null) {
      imageUrl = await uploadImageToCloudinary(state.imagePicked!);
    }

    return UpdateCompanyRequestModel(
      id: AppConstants.kUserId,
      firstName: firstName.isNullOrEmpty() ? companyModel.firstName : firstName,
      lastName: lastName.isNullOrEmpty() ? companyModel.lastName : lastName,
      email: email.isNullOrEmpty() ? companyModel.email : email,
      companyName:
          companyName.isNullOrEmpty() ? companyModel.companyName : companyName,
      companyAddress:
          location.isNullOrEmpty() ? companyModel.companyAddress : location,
      phoneNumber:
          phoneNumber.isNullOrEmpty() ? companyModel.phone : phoneNumber,
      profileImageUrl: imageUrl ?? companyModel.profileImageUrl,
      countryId: state.countryId ?? companyModel.countryId,
    );
  }
}
