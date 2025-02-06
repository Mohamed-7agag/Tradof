import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradof/features/company/company_setting/data/model/social_media_model.dart';
import 'package:tradof/features/company/company_setting/data/repo/company_setting_repo.dart';
import 'package:tradof/features/company/company_profile/data/model/company_update_request_model.dart';

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
        message: message,
      ));
    });
  }

  Future<void> updateCompanyProfile(
      UpdateCompanyRequestModel updateCompanyRequestModel) async {
    emit(state.copyWith(
        status: CompanySettingStatus.updateCompanyProfileLoading));
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
      (message) => emit(state.copyWith(
        status: CompanySettingStatus.updateCompanyProfileSuccess,
        message: message,
        errMessage: null,
      )),
    );
  }

  Future<void> addUpdateSocialMedia({
    required List<SocialMediaModel> socialMediaModel,
  }) async {
    emit(state.copyWith(status: CompanySettingStatus.addUpdateSocialMediaLoading));
    final result = await _companySettingRepo.addUpdateSocialMedia(
      socialMediaModel: socialMediaModel,
    );
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: CompanySettingStatus.addUpdateSocialMediaFailure,
          errMessage: failure.errMessage,
        ),
      ),
      (message) => emit(state.copyWith(
        status: CompanySettingStatus.addUpdateSocialMediaSuccess,
        message: message,
        errMessage: null,
      )),
    );
  }
}
