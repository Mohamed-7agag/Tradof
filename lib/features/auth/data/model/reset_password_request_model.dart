class ResetPasswordRequestModel {

  const ResetPasswordRequestModel({
    required this.email,
    required this.resetToken,
    required this.newPassword,
    required this.confirmPassword,
  });
  final String email;
  final String resetToken;
  final String newPassword;
  final String confirmPassword;

  Map<String, dynamic> toJson() => {
        'email': email,
        'token': resetToken,
        'newPassword': newPassword,
        'confirmPassword': confirmPassword
      };
}
