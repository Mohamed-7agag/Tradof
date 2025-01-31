import 'package:equatable/equatable.dart';
import 'package:tradof/features/auth/data/model/language_model.dart';
import 'package:tradof/features/auth/data/model/specialization_model.dart';

class CompanyModel extends Equatable {
  final int id;
  final String companyAddress;
  final String userId;
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
    required this.userId,
    required this.countryId,
    required this.specializations,
    required this.preferredLanguages,
    this.socialMedia = const [],
    this.netPrice = 0,
    required this.subscriptionStartDate,
    required this.subscriptionEndDate,
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json) => CompanyModel(
        id: json['id'] as int,
        companyAddress: json['companyAddress'] as String,
        userId: json['userId'] as String,
        countryId: json['countryId'] as int,
        specializations: List<SpecializationModel>.from(json['specializations'] ?? []),
        preferredLanguages: List<LanguageModel>.from(json['preferredLanguages'] ?? []),
        socialMedia: json['socialMedia'] ?? [],
        netPrice: (json['netPrice'] as num?)?.toDouble() ?? 0,
        subscriptionStartDate: json['subscriptionStartDate'] != null
            ? DateTime.parse(json['subscriptionStartDate'])
            : DateTime(0001, 1, 1),
        subscriptionEndDate: json['subscriptionEndDate'] != null
            ? DateTime.parse(json['subscriptionEndDate'])
            : DateTime(0001, 1, 1),
      );


  @override
  List<Object?> get props => [
        id,
        companyAddress,
        userId,
        countryId,
        specializations,
        preferredLanguages,
        socialMedia,
        netPrice,
        subscriptionStartDate,
        subscriptionEndDate,
      ];
}
