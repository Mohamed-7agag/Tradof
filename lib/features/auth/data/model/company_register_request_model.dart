class CompanyRegisterRequestModel {
  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final int countryId;
  final String companyAddress;
  final String jobTitle;
  final List<int> specializationIds;
  final List<int> preferredLanguageIds;
  final String profileImageUrl;

  CompanyRegisterRequestModel({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.countryId,
    required this.jobTitle,
    required this.companyAddress,
    required this.specializationIds,
    required this.preferredLanguageIds,
    this.profileImageUrl = '',
  });

  // Convert the model to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'firstName': firstName,
      'lastName': lastName,
      'countryId': countryId,
      'phoneNumber': phoneNumber,
      'jobTitle': jobTitle,
      'companyAddress': companyAddress,
      'specializationIds': specializationIds,
      'preferredLanguageIds': preferredLanguageIds,
      'profileImageUrl': profileImageUrl,
    };
  }

  // Create an instance from a JSON map
  factory CompanyRegisterRequestModel.fromJson(Map<String, dynamic> json) {
    return CompanyRegisterRequestModel(
      email: json['email'],
      password: json['password'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      phoneNumber: json['phoneNumber'],
      countryId: json['countryId'],
      jobTitle: json['jobTitle'],
      companyAddress: json['companyAddress'],
      specializationIds: List<int>.from(json['specializationIds']),
      preferredLanguageIds: List<int>.from(json['preferredLanguageIds']),
      profileImageUrl: json['profileImageUrl'],
    );
  }
}
