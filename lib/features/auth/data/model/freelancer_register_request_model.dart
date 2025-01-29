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

  // Convert the model to a JSON map
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

  // Create an instance from a JSON map
  factory FreelancerRegisterRequestModel.fromJson(Map<String, dynamic> json) {
    return FreelancerRegisterRequestModel(
      email: json['email'],
      password: json['password'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      countryId: json['countryId'],
      phoneNumber: json['phoneNumber'],
      specializationIds: List<int>.from(json['specializationIds']),
      languagePairs: (json['languagePairs'] as List)
          .map((pair) => LanguagePair.fromJson(pair))
          .toList(),
      profileImageUrl: json['profileImageUrl'],
    );
  }
}

class LanguagePair {
  final int languageFromId;
  final int languageToId;

  LanguagePair({
    required this.languageFromId,
    required this.languageToId,
  });

  // Convert the model to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'languageFromId': languageFromId,
      'languageToId': languageToId,
    };
  }

  // Create an instance from a JSON map
  factory LanguagePair.fromJson(Map<String, dynamic> json) {
    return LanguagePair(
      languageFromId: json['languageFromId'],
      languageToId: json['languageToId'],
    );
  }
}
