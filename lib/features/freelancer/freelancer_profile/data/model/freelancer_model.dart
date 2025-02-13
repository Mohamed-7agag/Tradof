import '../../../../auth/data/model/specialization_model.dart';
import '../../../../company/company_profile/data/model/social_media_model.dart';
import 'freelancer_langauge_pair_model.dart';

class FreelancerModel {
  final String userId;
  final String firstName;
  final String lastName;
  final String profileImageUrl;
  final String countryName;
  final int countryId;
  final String? cvFilePath;
  final String email;
  final String phone;
  final int ratingSum;
  final int reviewCount;
  final List<FreelancerLangaugePairModel> languagePairs;
  final List<SpecializationModel> specializations;
  final List<SocialMediaModel> socialMedias;

  FreelancerModel({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.profileImageUrl,
    required this.countryName,
    required this.countryId,
    this.cvFilePath,
    required this.email,
    required this.phone,
    required this.ratingSum,
    required this.reviewCount,
    required this.languagePairs,
    required this.specializations,
    required this.socialMedias,
  });

  factory FreelancerModel.fromJson(Map<String, dynamic> json) =>
      FreelancerModel(
        userId: json["userId"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        profileImageUrl: json["profileImageUrl"],
        countryName: json["countryName"],
        countryId: json["countryId"],
        cvFilePath: json["cvFilePath"] as String?,
        email: json["email"],
        phone: json["phone"],
        ratingSum: json["ratingSum"],
        reviewCount: json["reviewCount"],
        languagePairs: List<FreelancerLangaugePairModel>.from(
          json["freelancerLanguagePairs"]
              .map((x) => FreelancerLangaugePairModel.fromJson(x)),
        ),
        specializations: List<SpecializationModel>.from(
          json["freelancerSpecializations"]
              .map((x) => SpecializationModel.fromJson(x)),
        ),
        socialMedias: List<SocialMediaModel>.from(
          json["freelancerSocialMedias"]
              .map((x) => SocialMediaModel.fromJson(x)),
        ),
      );
}
