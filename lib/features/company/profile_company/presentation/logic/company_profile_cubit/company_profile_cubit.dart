import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/app_constants.dart';
import '../../../data/model/company_model.dart';
import '../../../data/model/company_update_request_model.dart';
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
            ));
  }

 

  Future<void> addPreferedLanguages({required List<int> languagesIds}) async {
    emit(state.copyWith(status: CompanyProfileStatus.preferedLanguagesLoading));
    final result = await _profileCompanyRepo.addPreferedLanguages(
      languagesIds: languagesIds,
    );
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: CompanyProfileStatus.preferedLanguagesFailure,
          errorMessage: failure.errMessage,
        ),
      ),
      (message) => emit(state.copyWith(
        status: CompanyProfileStatus.preferedLanguagesSuccess,
        message: message,
      )),
    );
  }

  Future<void> deletePreferedLanguages(
      {required List<int> languagesIds}) async {
    emit(state.copyWith(status: CompanyProfileStatus.preferedLanguagesLoading));
    final result = await _profileCompanyRepo.deletePreferedLanguages(
      languagesIds: languagesIds,
    );
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: CompanyProfileStatus.preferedLanguagesFailure,
          errorMessage: failure.errMessage,
        ),
      ),
      (message) => emit(
        state.copyWith(
          status: CompanyProfileStatus.preferedLanguagesSuccess,
          message: message,
        ),
      ),
    );
  }

  Future<void> addIndustriesServed({required List<int> industriesIds}) async {
    emit(state.copyWith(status: CompanyProfileStatus.industriesServedLoading));
    final result = await _profileCompanyRepo.addIndustriesServed(
      industriesIds: industriesIds,
    );
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: CompanyProfileStatus.industriesServedFailure,
          errorMessage: failure.errMessage,
        ),
      ),
      (message) => emit(state.copyWith(
        status: CompanyProfileStatus.industriesServedSuccess,
        message: message,
      )),
    );
  }

  Future<void> deleteIndustriesServed(
      {required List<int> industriesIds}) async {
    emit(state.copyWith(status: CompanyProfileStatus.industriesServedLoading));
    final result = await _profileCompanyRepo.deleteIndustriesServed(
      industriesIds: industriesIds,
    );
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: CompanyProfileStatus.industriesServedFailure,
          errorMessage: failure.errMessage,
        ),
      ),
      (message) => emit(
        state.copyWith(
          status: CompanyProfileStatus.industriesServedSuccess,
          message: message,
        ),
      ),
    );
  }
}
