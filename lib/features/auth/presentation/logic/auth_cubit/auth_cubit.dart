import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradof/core/cache/cache_helper.dart';
import 'package:tradof/features/auth/data/model/login_response_model.dart';
import 'package:tradof/features/auth/data/model/reset_password_request_model.dart';
import 'package:tradof/features/auth/data/repo/auth_repo.dart';

import '../../../../../core/utils/app_constants.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authRepo) : super(const AuthState());

  final AuthRepo _authRepo;

  // login
  Future<void> login(String email, String password) async {
    emit(state.copyWith(status: AuthStatus.loading));
    final result = await _authRepo.login(email, password);
    result.fold((failure) {
      emit(state.copyWith(
        status: AuthStatus.error,
        errorMessage: failure.errMessage,
      ));
    }, (response) {
      emit(state.copyWith(
        status: AuthStatus.login,
        email: email,
        password: password,
      ));
      _cacheUserData(response);
    });
  }

  //forget password
  Future<void> forgetPassword(String email) async {
    emit(state.copyWith(status: AuthStatus.loading));
    final result = await _authRepo.forgetPassword(email);
    result.fold(
      (failure) => emit(state.copyWith(
        status: AuthStatus.error,
        errorMessage: failure.errMessage,
      )),
      (successMessage) => emit(state.copyWith(
        status: AuthStatus.forgotPassword,
        message: successMessage,
        email: email,
      )),
    );
  }

  // otp
  Future<void> otpVerification(String otp) async {
    emit(state.copyWith(status: AuthStatus.loading));
    final result = await _authRepo.verifyOtp(state.email, otp);
    result.fold(
      (failure) => emit(state.copyWith(
        status: AuthStatus.error,
        errorMessage: failure.errMessage,
      )),
      (success) => emit(state.copyWith(
        status: AuthStatus.otpVerification,
        otp: otp,
        resetToken: success['resetToken'],
      )),
    );
  }

  //reset password
  Future<void> resetPassword(String newPassword) async {
    emit(state.copyWith(status: AuthStatus.loading));

    final ResetPasswordRequestModel request = ResetPasswordRequestModel(
      email: state.email,
      resetToken: state.resetToken,
      newPassword: newPassword,
      confirmPassword: newPassword,
    );

    final result = await _authRepo.resetPassword(request);
    result.fold(
      (failure) => emit(state.copyWith(
        status: AuthStatus.error,
        errorMessage: failure.errMessage,
      )),
      (successMessage) => emit(state.copyWith(
        status: AuthStatus.resetPassword,
        newPassword: newPassword,
        message: successMessage,
      )),
    );
  }

//! Helpers
  void _cacheUserData(LoginResponseModel response) {
    CacheHelper.setSecuredString(AppConstants.userId, response.userId);
    CacheHelper.setSecuredString(AppConstants.token, response.token);
    CacheHelper.setData(key: AppConstants.role, value: response.role);
  }
}
