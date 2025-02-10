import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/app_constants.dart';
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

  Future<void> getCompanyProfile() async {
    emit(state.copyWith(status: CompanyProfileStatus.getCompanyloading));
    final result = await _profileCompanyRepo.getCompanyProfrile(
      companyId: AppConstants.kUserId,
    );
    result.fold(
      (failure) => emit(state.copyWith(
        status: CompanyProfileStatus.getCompanyFailure,
        errorMessage: failure.errMessage,
      )),
      (companyModel) => emit(
        state.copyWith(
          status: CompanyProfileStatus.getCompanySuccess,
          companyModel: companyModel,
        ),
      ),
    );
  }

  Future<void> getCompanyEmployees() async {
    emit(state.copyWith(
        status: CompanyProfileStatus.getCompanyEmployeesLoading));
    final result = await _profileCompanyRepo.getCompanyEmployees(
      companyId: AppConstants.kUserId,
    );
    result.fold(
      (failure) => emit(state.copyWith(
        status: CompanyProfileStatus.getCompanyEmployeesFailure,
        errorMessage: failure.errMessage,
      )),
      (companyEmployees) => emit(
        state.copyWith(
          status: CompanyProfileStatus.getCompanyEmployeesSuccess,
          companyEmployees: companyEmployees,
        ),
      ),
    );
  }

  Future<void> addCompanyEmployee(
      {required CompanyEmployeeRequestModel employeeModel}) async {
    emit(state.copyWith(
        status: CompanyProfileStatus.addCompanyEmployeesLoading));
    final result = await _profileCompanyRepo.addCompanyEmployee(
      employeeModel: employeeModel,
    );
    result.fold(
      (failure) => emit(state.copyWith(
        status: CompanyProfileStatus.addCompanyEmployeesFailure,
        errorMessage: failure.errMessage,
      )),
      (success) => emit(
        state.copyWith(
          status: CompanyProfileStatus.addCompanyEmployeesSuccess,
          message: success,
        ),
      ),
    );
  }

  void setGroupNameAndCountry({String? groupName, int? countryId}) {
    emit(state.copyWith(groupName: groupName, countryId: countryId));
  }

  Future<void> addUpdateSocialMedia({
    required List<SocialMediaModel> socialMedia,
  }) async {
    emit(state.copyWith(
        status: CompanyProfileStatus.addUpdateSocialMediaLoading));
    final result = await _profileCompanyRepo.addUpdateSocialMedia(
      socialMediaModel: socialMedia,
    );
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: CompanyProfileStatus.addUpdateSocialMediaFailure,
          errorMessage: failure.errMessage,
        ),
      ),
      (message) => emit(state.copyWith(
        status: CompanyProfileStatus.addUpdateSocialMediaSuccess,
        message: message,
        errorMessage: null,
      )),
    );
  }

  Future<void> updatePreferredLanguages({
    required List<int> addedLanguagesIds,
    required List<int> deletedLanguagesIds,
  }) async {
    emit(state.copyWith(status: CompanyProfileStatus.preferedLanguagesLoading));

    try {
      if (addedLanguagesIds.isNotEmpty) {
        final addResult = await _profileCompanyRepo.addPreferedLanguages(
            languagesIds: addedLanguagesIds);
        addResult.fold(
          (failure) => emit(
            state.copyWith(
              status: CompanyProfileStatus.preferedLanguagesFailure,
              errorMessage: failure.errMessage,
            ),
          ),
          (_) => {},
        );
      }

      if (deletedLanguagesIds.isNotEmpty) {
        final deleteResult = await _profileCompanyRepo.deletePreferedLanguages(
            languagesIds: deletedLanguagesIds);
        deleteResult.fold(
          (failure) => emit(
            state.copyWith(
              status: CompanyProfileStatus.preferedLanguagesFailure,
              errorMessage: failure.errMessage,
            ),
          ),
          (_) => {},
        );
      }
      if (!state.status.isPreferedLanguagesFailure) {
        emit(state.copyWith(
          status: CompanyProfileStatus.preferedLanguagesSuccess,
          message: 'Preferred languages updated successfully',
        ));
      }
    } catch (e) {
      emit(
        state.copyWith(
          status: CompanyProfileStatus.preferedLanguagesFailure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> updateIndustriesServed({
    required List<int> addedIndustriesIds,
    required List<int> deletedIndustriesIds,
  }) async {
    emit(state.copyWith(status: CompanyProfileStatus.industriesServedLoading));

    try {
      if (addedIndustriesIds.isNotEmpty) {
        final addResult = await _profileCompanyRepo.addIndustriesServed(
          industriesIds: addedIndustriesIds,
        );
        addResult.fold(
          (failure) => emit(
            state.copyWith(
              status: CompanyProfileStatus.industriesServedFailure,
              errorMessage: failure.errMessage,
            ),
          ),
          (_) => {},
        );
      }

      if (deletedIndustriesIds.isNotEmpty) {
        final deleteResult = await _profileCompanyRepo.deleteIndustriesServed(
          industriesIds: deletedIndustriesIds,
        );
        deleteResult.fold(
          (failure) => emit(
            state.copyWith(
              status: CompanyProfileStatus.industriesServedFailure,
              errorMessage: failure.errMessage,
            ),
          ),
          (_) => {},
        );
      }

      if (!state.status.isIndustriesServedFailure) {
        emit(state.copyWith(
          status: CompanyProfileStatus.industriesServedSuccess,
          message: 'Industries served updated successfully',
        ));
      }
    } catch (e) {
      emit(
        state.copyWith(
          status: CompanyProfileStatus.industriesServedFailure,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
