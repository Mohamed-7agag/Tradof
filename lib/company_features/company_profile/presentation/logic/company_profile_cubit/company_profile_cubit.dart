import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/exception.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../data/model/company_employee_model.dart';
import '../../../data/model/company_employee_request_model.dart';
import '../../../data/model/company_model.dart';
import '../../../data/model/social_media_model.dart';
import '../../../data/repos/company_profile_repo.dart';

part 'company_profile_state.dart';

class CompanyProfileCubit extends Cubit<CompanyProfileState> {
  CompanyProfileCubit(this._profileCompanyRepo)
      : super(const CompanyProfileState());

  final CompanyProfileRepo _profileCompanyRepo;

  Future<void> getCompanyProfile({String? companyId}) async {
    emit(state.copyWith(status: CompanyProfileStatus.getCompanyloading));
    try {
      final company = await _profileCompanyRepo.getCompanyProfrile(
        companyId: companyId ?? AppConstants.kUserId,
      );
      emit(state.copyWith(
        status: CompanyProfileStatus.getCompanySuccess,
        companyModel: company,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: CompanyProfileStatus.getCompanyFailure,
        errorMessage: ServerFailure.fromError(e).errMessage,
      ));
    }
  }

  Future<void> getCompanyEmployees() async {
    emit(state.copyWith(
      status: CompanyProfileStatus.getCompanyEmployeesLoading,
    ));
    try {
      final companyEmployees = await _profileCompanyRepo.getCompanyEmployees(
        companyId: AppConstants.kUserId,
      );
      emit(state.copyWith(
        status: CompanyProfileStatus.getCompanyEmployeesSuccess,
        companyEmployees: companyEmployees,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: CompanyProfileStatus.getCompanyEmployeesFailure,
        errorMessage: ServerFailure.fromError(e).errMessage,
      ));
    }
  }

  Future<void> addCompanyEmployee(
      {required CompanyEmployeeRequestModel employeeModel}) async {
    emit(state.copyWith(
      status: CompanyProfileStatus.addCompanyEmployeesLoading,
    ));

    try {
      final result = await _profileCompanyRepo.addCompanyEmployee(
        employeeModel: employeeModel,
      );
      emit(state.copyWith(
        status: CompanyProfileStatus.addCompanyEmployeesSuccess,
        message: result,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: CompanyProfileStatus.addCompanyEmployeesFailure,
        errorMessage: ServerFailure.fromError(e).errMessage,
      ));
    }
  }

  void setGroupNameAndCountryId({String? groupName, int? countryId}) {
    emit(state.copyWith(groupName: groupName, countryId: countryId));
  }

  Future<void> addUpdateSocialMedia({
    required List<SocialMediaModel> socialMedia,
  }) async {
    emit(state.copyWith(
      status: CompanyProfileStatus.addUpdateSocialMediaLoading,
    ));
    try {
      final result = await _profileCompanyRepo.addUpdateSocialMedia(
        socialMediaModel: socialMedia,
      );
      emit(state.copyWith(
        status: CompanyProfileStatus.addUpdateSocialMediaSuccess,
        message: result,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: CompanyProfileStatus.addUpdateSocialMediaFailure,
        errorMessage: ServerFailure.fromError(e).errMessage,
      ));
    }
  }

  Future<void> updatePreferredLanguages({
    required List<int> addedLanguagesIds,
    required List<int> deletedLanguagesIds,
  }) async {
    emit(state.copyWith(
      status: CompanyProfileStatus.preferedLanguagesLoading,
    ));

    try {
      if (addedLanguagesIds.isNotEmpty) {
        await _profileCompanyRepo.addPreferedLanguages(
          languagesIds: addedLanguagesIds,
        );
      }
      if (deletedLanguagesIds.isNotEmpty) {
        await _profileCompanyRepo.deletePreferedLanguages(
          languagesIds: deletedLanguagesIds,
        );
      }
      emit(state.copyWith(
        status: CompanyProfileStatus.preferedLanguagesSuccess,
        message: 'Preferred languages updated successfully',
      ));
    } catch (e) {
      emit(
        state.copyWith(
          status: CompanyProfileStatus.preferedLanguagesFailure,
          errorMessage: ServerFailure.fromError(e).errMessage,
        ),
      );
    }
  }

  Future<void> updateIndustriesServed({
    required List<int> addedIndustriesIds,
    required List<int> deletedIndustriesIds,
  }) async {
    emit(state.copyWith(
      status: CompanyProfileStatus.industriesServedLoading,
    ));

    try {
      if (addedIndustriesIds.isNotEmpty) {
        await _profileCompanyRepo.addIndustriesServed(
          industriesIds: addedIndustriesIds,
        );
      }

      if (deletedIndustriesIds.isNotEmpty) {
        await _profileCompanyRepo.deleteIndustriesServed(
          industriesIds: deletedIndustriesIds,
        );
      }

      emit(state.copyWith(
        status: CompanyProfileStatus.industriesServedSuccess,
        message: 'Industries served updated successfully',
      ));
    } catch (e) {
      emit(
        state.copyWith(
          status: CompanyProfileStatus.industriesServedFailure,
          errorMessage: ServerFailure.fromError(e).errMessage,
        ),
      );
    }
  }
}
