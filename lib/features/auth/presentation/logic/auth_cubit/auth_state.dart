part of 'auth_cubit.dart';

enum AuthStatus {
  initial,
  login,
  forgotPassword,
  otpVerification,
  resetPassword,
  error,
  loading,
}

extension AuthStepX on AuthStatus {
  bool get isLogin => this == AuthStatus.login;
  bool get isForgotPassword => this == AuthStatus.forgotPassword;
  bool get isOtpVerification => this == AuthStatus.otpVerification;
  bool get isResetPassword => this == AuthStatus.resetPassword;
  bool get isError => this == AuthStatus.error;
  bool get isLoading => this == AuthStatus.loading;
}

class AuthState extends Equatable {
  final AuthStatus status;
  final String email;
  final String password;
  final String otp;
  final String newPassword;
  final String errorMessage;

  const AuthState({
    this.status = AuthStatus.initial,
    this.email = '',
    this.password = '',
    this.otp = '',
    this.newPassword = '',
    this.errorMessage = '',
  });

  AuthState copyWith({
    AuthStatus? status,
    String? email,
    String? password,
    String? otp,
    String? newPassword,
    String? errorMessage,
  }) {
    return AuthState(
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
      otp: otp ?? this.otp,
      newPassword: newPassword ?? this.newPassword,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        email,
        password,
        otp,
        newPassword,
        errorMessage,
      ];
}
