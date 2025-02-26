import 'package:equatable/equatable.dart';

class CompanyEmployeeModel extends Equatable {

  const CompanyEmployeeModel({
    required this.id,
    required this.fullName,
    required this.jobTitle,
    required this.email,
    required this.phoneNumber,
    required this.groupName,
    required this.country,
  });

  factory CompanyEmployeeModel.fromJson(Map<String, dynamic> json) {
    return CompanyEmployeeModel(
      id: json['id'],
      fullName: json['fullName'],
      jobTitle: json['jobTitle'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      groupName: json['groupName'],
      country: json['country'],
    );
  }
  final String id;
  final String fullName;
  final String jobTitle;
  final String email;
  final String phoneNumber;
  final String groupName;
  final String country;

  @override
  List<Object?> get props => [
        id,
        fullName,
        jobTitle,
        email,
        phoneNumber,
        groupName,
        country,
      ];
}
