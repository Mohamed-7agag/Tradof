import 'package:equatable/equatable.dart';

class UpdateCompanyRequestModel extends Equatable {
  final String id;
  final String companyAddress;
  final int countryId;
  final String firstName;
  final String companyName;
  final String lastName;
  final String phoneNumber;
  final String email;

  const UpdateCompanyRequestModel({
    required this.id,
    required this.companyAddress,
    required this.countryId,
    required this.firstName,
    required this.companyName,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'companyAddress': companyAddress,
      'countryId': countryId,
      'firstName': firstName,
      'companyName': companyName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'email': email,
    };
  }

  @override
  List<Object?> get props => [
        id,
        companyAddress,
        countryId,
        firstName,
        companyName,
        lastName,
        phoneNumber,
        email,
      ];
}
