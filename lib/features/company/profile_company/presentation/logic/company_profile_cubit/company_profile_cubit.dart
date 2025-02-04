import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradof/features/auth/data/model/language_model.dart';
import 'package:tradof/features/company/profile_company/data/model/company_update_request_model.dart';

import '../../../../../../core/utils/app_constants.dart';
import '../../../data/model/company_model.dart';
import '../../../data/repos/company_profile_repo.dart';

part 'company_profile_state.dart';

class CompanyProfileCubit extends Cubit<CompanyProfileState> {
  CompanyProfileCubit(this._profileCompanyRepo)
      : super(const CompanyProfileState());

  final CompanyProfileRepo _profileCompanyRepo;

  Future<void> getCompanyProfile() async {
    emit(state.copyWith(status: CompanyProfileStatus.loading));
    final result = await _profileCompanyRepo.getCompanyProfrile(
      companyId: AppConstants.kUserId,
    );
    result.fold(
        (failure) => emit(state.copyWith(
              status: CompanyProfileStatus.error,
              errorMessage: failure.errMessage,
            )),
        (companyModel) => emit(
              state.copyWith(
                status: CompanyProfileStatus.companyDataFetched,
                companyModel: companyModel,
              ),
            ));
  }

  Future<void> addPreferedLanguages(
      {required LanguageModel languageModel}) async {
    final result = await _profileCompanyRepo.addPreferedLanguages(
      id: languageModel.id,
    );
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: CompanyProfileStatus.error,
          errorMessage: failure.errMessage,
        ),
      ),
      (message) => emit(state.copyWith(
        status: CompanyProfileStatus.addPreferredLanguage,
        message: message,
      )),
    );
  }

  Future<void> deletePreferedLanguages(LanguageModel languageModel) async {
    final result = await _profileCompanyRepo.deletePreferedLanguages(
        languageModel: languageModel);
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: CompanyProfileStatus.error,
          errorMessage: failure.errMessage,
        ),
      ),
      (message) => emit(
        state.copyWith(
          status: CompanyProfileStatus.deletePreferredLanguage,
          message: message,
        ),
      ),
    );
  }

  Future<void> updateCompanyProfile(
      CompanyUpdateRequestModel companyUpdateRequestModel) async {
    emit(state.copyWith(
      status: CompanyProfileStatus.loading,
    ));
    final result = await _profileCompanyRepo.updateCompanyProfile(
      companyUpdateRequestModel: companyUpdateRequestModel,
    );
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: CompanyProfileStatus.error,
          errorMessage: failure.errMessage,
        ),
      ),
      (message) => emit(state.copyWith(
        status: CompanyProfileStatus.updateCompanyProfile,
        message: message,
        errorMessage: null,
      )),
    );
  }
}
