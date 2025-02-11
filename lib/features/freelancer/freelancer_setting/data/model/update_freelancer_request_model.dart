import 'package:equatable/equatable.dart';

class UpdateFreelancerRequestModel extends Equatable {
  final int countryId;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String email;
  final String profileImageUrl;

  const UpdateFreelancerRequestModel({
    required this.countryId,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
    required this.profileImageUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      'countryId': countryId,
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'email': email,
      'profileImageUrl': profileImageUrl
    };
  }

  @override
  List<Object?> get props =>
      [countryId, firstName, lastName, phoneNumber, email, profileImageUrl];
}
