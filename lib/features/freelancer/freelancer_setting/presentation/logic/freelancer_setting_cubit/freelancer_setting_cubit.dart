import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradof/features/freelancer/freelancer_setting/data/repo/freelancer_setting_repo.dart';

part 'freelancer_setting_state.dart';

class FreelancerSettingCubit extends Cubit<FreelancerSettingState> {
  FreelancerSettingCubit(this._freelancerSettingRepo)
      : super(FreelancerSettingState());
  final FreelancerSettingRepo _freelancerSettingRepo;
  Future<void> changeCompanyPassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    emit(state.copyWith(status: FreelancerSettingStatus.changePasswordLoading));
    final result = await _freelancerSettingRepo.changeFreelancerPassword(
      currentPassword: currentPassword,
      newPassword: newPassword,
    );
    result.fold((failure) {
      emit(state.copyWith(
        status: FreelancerSettingStatus.changePasswordFailure,
        errMessage: failure.errMessage,
      ));
    }, (message) {
      emit(state.copyWith(
        status: FreelancerSettingStatus.changePasswordSuccess,
        message: 'Password Changed Successfully',
      ));
    });
  }
}
