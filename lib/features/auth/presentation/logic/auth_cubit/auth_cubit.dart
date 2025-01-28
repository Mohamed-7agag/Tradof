import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradof/features/auth/data/repo/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authRepo) : super(const AuthState());

  final AuthRepo _authRepo;

  // login
  Future<void> login(String email, String password) async {
    emit(state.copyWith(status: AuthStatus.loading));
    final result = await _authRepo.login(email, password);
    result.fold(
      (failure) => emit(state.copyWith(
        status: AuthStatus.error,
        errorMessage: failure.errMessage,
      )),
      (success) => emit(state.copyWith(
        status: AuthStatus.login,
        email: email,
        password: password,
      )),
    );
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
      (success) => emit(state.copyWith(
        status: AuthStatus.forgotPassword,
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
      )),
    );
  }

  //reset password
  Future<void> resetPassword(String newPassword) async {
    emit(state.copyWith(status: AuthStatus.loading));
    final result = await _authRepo.resetPassword(newPassword);
    result.fold(
      (failure) => emit(state.copyWith(
        status: AuthStatus.error,
        errorMessage: failure.errMessage,
      )),
      (success) => emit(state.copyWith(
        status: AuthStatus.resetPassword,
        newPassword: newPassword,
      )),
    );
  }
}
