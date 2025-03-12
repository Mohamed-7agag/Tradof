part of 'auth_cubit.dart';

enum AuthStatus {
  initial,
  login,
  forgotPassword,
  otpVerification,
  resendOtp,
  resetPassword,
  error,
  loading,
}

extension AuthStepX on AuthStatus {
  bool get isLogin => this == AuthStatus.login;
  bool get isForgotPassword => this == AuthStatus.forgotPassword;
  bool get isOtpVerification => this == AuthStatus.otpVerification;
  bool get isResetPassword => this == AuthStatus.resetPassword;
  bool get isResendOtp => this == AuthStatus.resendOtp;
  bool get isError => this == AuthStatus.error;
  bool get isLoading => this == AuthStatus.loading;
}

class AuthState extends Equatable {

  const AuthState({
    this.status = AuthStatus.initial,
    this.email = '',
    this.otp = '',
    this.errorMessage = '',
    this.message = '',
    this.resetToken = '',
  });
  final AuthStatus status;
  final String email;
  final String otp;
  final String errorMessage;
  final String message;
  final String resetToken;

  AuthState copyWith({
    AuthStatus? status,
    String? email,
    String? otp,
    String? errorMessage,
    String? message,
    String? resetToken,
  }) {
    return AuthState(
      status: status ?? this.status,
      email: email ?? this.email,
      otp: otp ?? this.otp,
      errorMessage: errorMessage ?? this.errorMessage,
      message: message ?? this.message,
      resetToken: resetToken ?? this.resetToken,
    );
  }

  @override
  List<Object?> get props => [
        status,
        email,
        otp,
        errorMessage,
        message,
        resetToken,
      ];
}
