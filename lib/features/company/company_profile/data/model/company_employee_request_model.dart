class CompanyEmployeeRequestModel {
  final String jobTitle;
  final int countryId;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String email;
  final String password;
  final String groupName;
  final String companyId;

  const CompanyEmployeeRequestModel({
    required this.jobTitle,
    required this.countryId,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
    required this.password,
    required this.groupName,
    required this.companyId,
  });

  Map<String, dynamic> toJson() {
    return {
      'jobTitle': jobTitle,
      'countryId': countryId,
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'email': email,
      'password': password,
      'groupName': groupName,
      'companyId': companyId,
    };
  }
}