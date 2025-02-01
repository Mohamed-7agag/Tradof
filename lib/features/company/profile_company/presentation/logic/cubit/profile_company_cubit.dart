import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tradof/core/cache/cache_helper.dart';
import 'package:tradof/core/utils/app_constants.dart';
import 'package:tradof/features/auth/data/model/language_model.dart';
import 'package:tradof/features/company/profile_company/data/model/company_model.dart';
import 'package:tradof/features/company/profile_company/data/repos/profile_company_repo.dart';

part 'profile_company_state.dart';

class ProfileCompanyCubit extends Cubit<ProfileCompanyState> {
  ProfileCompanyCubit(this.profileCompanyRepo)
      : super(const ProfileCompanyState(status: ProfileCompanyStatus.initial));

  final ProfileCompanyRepo profileCompanyRepo;

  Future<void> getCompanyProfile() async {
    emit(state.copyWith(status: ProfileCompanyStatus.loading));
    final result = await profileCompanyRepo.getCompanyProfrile(
        id: await CacheHelper.getSecuredString(AppConstants.userId));
    result.fold(
        (failure) => emit(
              state.copyWith(
                status: ProfileCompanyStatus.error,
                errorMessage: failure.errMessage,
              ),
            ), (companyModel) {
      emit(
        state.copyWith(
          status: ProfileCompanyStatus.success,
          companyModel: companyModel,
        ),
      );
    });
  }

  Future<void> deletePreferedLanguages(LanguageModel languageModel) async {
    final result = await profileCompanyRepo.deletePreferedLanguages(
        languageModel: languageModel);
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: ProfileCompanyStatus.error,
          errorMessage: failure.errMessage,
        ),
      ),
      (message) => emit(state.copyWith(
        status: ProfileCompanyStatus.success,
      )),
    );
  }

  Future<void> addPreferedLanguages({
    required LanguageModel languageModel,
  }) async {
    final result = await profileCompanyRepo.addPreferedLanguages(
        languageModel: languageModel);
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: ProfileCompanyStatus.error,
          errorMessage: failure.errMessage,
        ),
      ),
      (message) => emit(state.copyWith(
        status: ProfileCompanyStatus.success,
      )),
    );
  }
}
