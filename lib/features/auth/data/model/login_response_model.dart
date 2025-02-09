class LoginResponseModel {
  final String userId;
  final String role;
  final String token;
  final String refreshToken;

  const LoginResponseModel({
    required this.userId,
    required this.role,
    required this.token,
    required this.refreshToken,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      userId: json['userId'],
      role: json['role'],
      token: json['token'],
      refreshToken: json['refreshToken'],
    );
  }
}
