import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/api/dio_factory.dart';
import '../../../../../core/cache/cache_helper.dart';
import '../../../../../core/errors/exception.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../settings/data/repo/miscellaneous_repo/miscellaneous_repo.dart';
import '../../../data/model/login_response_model.dart';
import '../../../data/model/reset_password_request_model.dart';
import '../../../data/repo/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authRepo, this._miscellaneousRepo) : super(const AuthState());

  final AuthRepo _authRepo;
  final MiscellaneousRepo _miscellaneousRepo;

  Future<void> login(String email, String password) async {
    emit(state.copyWith(status: AuthStatus.loading));
    try {
      final result = await _authRepo.login(email, password);
      await _cacheUserData(result);
      if (result.role == 'CompanyAdmin') {
        final bool isSubscribed = await getCurrentSubscription(result.userId);
        if (!isSubscribed) {
          await _resetCachedUserData();
          emit(state.copyWith(
            status: AuthStatus.subscriptionRequired,
          ));
          return;
        }
      }
      emit(state.copyWith(status: AuthStatus.login));
    } catch (e) {
      emit(state.copyWith(
        status: AuthStatus.error,
        errorMessage: ServerFailure.fromError(e).errMessage,
      ));
    }
  }

  Future<void> loginWithGoogle() async {
    emit(state.copyWith(status: AuthStatus.googleLoginLoading));
    try {
      await _authRepo.loginWithGoogle();
      //await _cacheUserData(result);
      emit(state.copyWith(status: AuthStatus.googleLoginSuccess));
    } catch (e) {
      emit(state.copyWith(
        status: AuthStatus.googleLoginFailure,
        errorMessage: ServerFailure.fromError(e).errMessage,
      ));
    }
  }

  Future<void> forgetPassword(String email) async {
    emit(state.copyWith(status: AuthStatus.loading));
    try {
      final result = await _authRepo.forgetPassword(email);
      emit(state.copyWith(
        status: AuthStatus.forgotPassword,
        message: result,
        email: email,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: AuthStatus.error,
        errorMessage: ServerFailure.fromError(e).errMessage,
      ));
    }
  }

  void setOtp(String otp) {
    emit(state.copyWith(otp: otp));
  }

  Future<void> otpVerification() async {
    emit(state.copyWith(status: AuthStatus.loading));
    try {
      final result = await _authRepo.verifyOtp(state.email, state.otp);
      emit(state.copyWith(
        status: AuthStatus.otpVerification,
        resetToken: result['resetToken'],
      ));
    } catch (e) {
      emit(state.copyWith(
        status: AuthStatus.error,
        errorMessage: ServerFailure.fromError(e).errMessage,
      ));
    }
  }

  Future<void> resendOtp() async {
    emit(state.copyWith(status: AuthStatus.loading));
    try {
      final result = await _authRepo.resendOtp(state.email);
      emit(state.copyWith(
        status: AuthStatus.resendOtp,
        message: result,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: AuthStatus.error,
        errorMessage: ServerFailure.fromError(e).errMessage,
      ));
    }
  }

  Future<void> resetPassword(String newPassword) async {
    emit(state.copyWith(status: AuthStatus.loading));
    try {
      final request = ResetPasswordRequestModel(
        email: state.email,
        resetToken: state.resetToken,
        newPassword: newPassword,
        confirmPassword: newPassword,
      );

      final result = await _authRepo.resetPassword(request);
      emit(state.copyWith(
        status: AuthStatus.resetPassword,
        message: result,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: AuthStatus.error,
        errorMessage: ServerFailure.fromError(e).errMessage,
      ));
    }
  }

  Future<bool> getCurrentSubscription(String companyId) async {
    try {
      final subscription = await _miscellaneousRepo.getCurrentSubscription(
        companyId: companyId,
      );
      return subscription;
    } catch (e) {
      return false;
    }
  }

  Future<void> _cacheUserData(LoginResponseModel response) async {
    await CacheHelper.setSecuredString(AppConstants.userId, response.userId);
    await CacheHelper.setSecuredString(AppConstants.token, response.token);
    AppConstants.kUserId = response.userId;
    await CacheHelper.setSecuredString(
      AppConstants.refreshToken,
      response.refreshToken,
    );
    CacheHelper.setData(key: AppConstants.role, value: response.role);
    DioFactory.setTokenIntoHeaderAfterLogin(response.token);
    NonAuthenticatedDioFactory.setTokenIntoHeaderAfterLogin(response.token);
  }

  Future<void> _resetCachedUserData() async {
    await CacheHelper.removeSecuredString(AppConstants.userId);
    await CacheHelper.removeSecuredString(AppConstants.token);
    await CacheHelper.removeSecuredString(AppConstants.refreshToken);
    await CacheHelper.removeData(key: AppConstants.role);
    AppConstants.kUserId = '';
    DioFactory.setTokenIntoHeaderAfterLogin('');
    NonAuthenticatedDioFactory.setTokenIntoHeaderAfterLogin('');
  }
}
