import 'package:equatable/equatable.dart';
import 'package:tradof/features/auth/data/model/language_model.dart';
import 'package:tradof/features/auth/data/model/specialization_model.dart';

class CompanyModel extends Equatable {
  final String id;
  final String companyAddress;
  final String companyName;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String jobTitle;
  final int ratingSum;
  final int reviewCount;
  final String profileImageUrl;
  final int countryId;
  final List<SpecializationModel> specializations;
  final List<LanguageModel> preferredLanguages;
  final List<dynamic> socialMedia;
  final double netPrice;
  final DateTime subscriptionStartDate;
  final DateTime subscriptionEndDate;

  const CompanyModel({
    required this.id,
    required this.companyAddress,
    required this.companyName,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.jobTitle,
    required this.ratingSum,
    required this.reviewCount,
    required this.profileImageUrl,
    required this.countryId,
    required this.specializations,
    required this.preferredLanguages,
    this.socialMedia = const [],
    this.netPrice = 0,
    required this.subscriptionStartDate,
    required this.subscriptionEndDate,
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json) => CompanyModel(
        id: json['id'] as String,
        companyAddress: json['companyAddress'] as String,
        companyName: json['companyName'] as String,
        firstName: json['firstName'] as String,
        lastName: json['lastName'] as String,
        email: json['email'] as String,
        phone: json['phone'] as String,
        jobTitle: json['jobTitle'] as String,
        ratingSum: json['ratingSum'] as int,
        reviewCount: json['reviewCount'] as int,
        profileImageUrl: json['profileImageUrl'] as String,
        countryId: json['countryId'] as int,
        specializations: List<SpecializationModel>.from(json['specializations']
            .map((x) => SpecializationModel.fromJson(x))),
        preferredLanguages: List<LanguageModel>.from(
            json['preferredLanguages'].map((x) => LanguageModel.fromJson(x))),
        socialMedia: json['socialMedia'] ?? [],
        netPrice: 0, // Default value as it's not in the response
        subscriptionStartDate: DateTime.now(), // Default to current date
        subscriptionEndDate: DateTime.now()
            .add(Duration(days: 365)), // Default to 1 year from now
      );

  @override
  List<Object?> get props => [
        id,
        companyAddress,
        companyName,
        firstName,
        lastName,
        email,
        phone,
        jobTitle,
        ratingSum,
        reviewCount,
        profileImageUrl,
        countryId,
        specializations,
        preferredLanguages,
        socialMedia,
        netPrice,
        subscriptionStartDate,
        subscriptionEndDate,
      ];
}
