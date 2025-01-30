class FreelancerRegisterRequestModel {
  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final int countryId;
  final String phoneNumber;
  final List<int> specializationIds;
  final List<LanguagePair> languagePairs;
  final String profileImageUrl;

  FreelancerRegisterRequestModel({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.countryId,
    required this.phoneNumber,
    required this.specializationIds,
    required this.languagePairs,
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
      'specializationIds': specializationIds,
      'languagePairs': languagePairs.map((pair) => pair.toJson()).toList(),
      'profileImageUrl': profileImageUrl,
    };
  }

}

class LanguagePair {
  final int languageFromId;
  final int languageToId;

  LanguagePair({
    required this.languageFromId,
    required this.languageToId,
  });

  Map<String, dynamic> toJson() {
    return {
      'languageFromId': languageFromId,
      'languageToId': languageToId,
    };
  }
}
