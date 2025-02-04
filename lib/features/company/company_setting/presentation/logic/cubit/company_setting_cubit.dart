import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradof/features/company/company_setting/data/repo/company_setting_repo.dart';

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
}
