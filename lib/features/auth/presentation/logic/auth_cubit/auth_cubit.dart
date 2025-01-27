import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradof/features/auth/data/repo/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(const AuthState(status: AuthStatus.initial));

  final AuthRepo authRepo;

  // login
  Future<void> login(String email, String password) async {
    emit(state.copyWith(status: AuthStatus.loading));
    final result = await authRepo.login(email, password);
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
    final result = await authRepo.forgetPassword(email);
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
    final result = await authRepo.verifyOtp(state.email, otp);
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
    final result = await authRepo.resetPassword(newPassword);
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
