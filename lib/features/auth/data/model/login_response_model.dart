class LoginResponseModel {
  final String userId;
  final String role;
  final String token;

  const LoginResponseModel({
    required this.userId,
    required this.role,
    required this.token,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      userId: json['userId'],
      role: json['role'],
      token: json['token'],
    );
  }
}
