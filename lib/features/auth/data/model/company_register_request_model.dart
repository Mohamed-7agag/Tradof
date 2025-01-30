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
}
