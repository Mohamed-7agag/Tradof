import 'package:equatable/equatable.dart';

import '../../../../core/utils/models/language_model.dart';
import '../../../../shared_features/auth/data/model/specialization_model.dart';
import 'social_media_model.dart';

class CompanyModel extends Equatable {

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
    required this.socialMedia,
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json) => CompanyModel(
        id: json['id'],
        companyAddress: json['companyAddress'],
        companyName: json['companyName'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        email: json['email'],
        phone: json['phone'],
        jobTitle: json['jobTitle'],
        ratingSum: json['ratingSum'],
        reviewCount: json['reviewCount'],
        profileImageUrl: json['profileImageUrl'],
        countryId: json['countryId'],
        specializations: List<SpecializationModel>.from(
          json['specializations'].map((x) => SpecializationModel.fromJson(x)),
        ),
        preferredLanguages: List<LanguageModel>.from(
          json['preferredLanguages'].map((x) => LanguageModel.fromJson(x)),
        ),
        socialMedia: List<SocialMediaModel>.from(
          json['socialMedia'].map((x) => SocialMediaModel.fromJson(x)),
        ),
      );
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
  final int countryId;
  final String profileImageUrl;
  final List<SpecializationModel> specializations;
  final List<LanguageModel> preferredLanguages;
  final List<SocialMediaModel> socialMedia;

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
      ];
}
