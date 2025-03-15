import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/exception.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/widgets/upload_image_to_cloudinary.dart';
import '../../../../profile/company_profile/data/model/company_model.dart';
import '../../../data/model/update_company_request_model.dart';
import '../../../data/repo/setting_repo.dart';

part 'company_setting_state.dart';

class CompanySettingCubit extends Cubit<CompanySettingState> {
  CompanySettingCubit(this._settingRepo)
      : super(const CompanySettingState());

  final SettingRepo _settingRepo;

  Future<void> changeCompanyPassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    emit(state.copyWith(status: CompanySettingStatus.changePasswordLoading));
    try {
      await _settingRepo.changePassword(
        isFreelancer: false,
        currentPassword: currentPassword,
        newPassword: newPassword,
      );
      emit(state.copyWith(
        status: CompanySettingStatus.changePasswordSuccess,
        message: 'Password Changed Successfully',
      ));
    } catch (e) {
      emit(state.copyWith(
        status: CompanySettingStatus.changePasswordFailure,
        errMessage: ServerFailure.fromError(e).errMessage,
      ));
    }
  }

  void setImageProfileAndCountryId({int? countryId, File? image}) {
    emit(state.copyWith(countryId: countryId, imagePicked: image));
  }

  Future<void> updateCompanyProfile(
    String firstName,
    String lastName,
    String companyName,
    String location,
    String phoneNumber,
    CompanyModel companyModel,
  ) async {
    emit(state.copyWith(
      status: CompanySettingStatus.updateCompanyProfileLoading,
    ));
    try {
      final updateCompanyRequestModel = await _buildUpdateCompanyRequestModel(
        firstName: firstName,
        lastName: lastName,
        companyName: companyName,
        location: location,
        phoneNumber: phoneNumber,
        companyModel: companyModel,
      );
      final response = await _settingRepo.updateCompanyProfile(
        updateCompanyRequestModel: updateCompanyRequestModel,
      );
      emit(state.copyWith(
        status: CompanySettingStatus.updateCompanyProfileSuccess,
        message: response,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: CompanySettingStatus.updateCompanyProfileFailure,
        errMessage: ServerFailure.fromError(e).errMessage,
      ));
    }
  }

  Future<UpdateCompanyRequestModel> _buildUpdateCompanyRequestModel({
    required String firstName,
    required String lastName,
    required String companyName,
    required String location,
    required String phoneNumber,
    required CompanyModel companyModel,
  }) async {
    String? imageUrl;
    if (state.imagePicked != null) {
      imageUrl = await uploadImageToCloudinary(state.imagePicked);
    }

    return UpdateCompanyRequestModel(
      id: AppConstants.kUserId,
      firstName: firstName.isEmpty ? companyModel.firstName : firstName,
      lastName: lastName.isEmpty ? companyModel.lastName : lastName,
      email: companyModel.email,
      companyName: companyName.isEmpty ? companyModel.companyName : companyName,
      companyAddress: location.isEmpty ? companyModel.companyAddress : location,
      phoneNumber: phoneNumber.isEmpty ? companyModel.phone : phoneNumber,
      profileImageUrl: imageUrl ?? companyModel.profileImageUrl ?? '',
      countryId: state.countryId ?? companyModel.countryId,
    );
  }
}
