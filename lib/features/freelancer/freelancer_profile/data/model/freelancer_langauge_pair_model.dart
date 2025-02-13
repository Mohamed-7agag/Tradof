import 'package:equatable/equatable.dart';

class FreelancerLangaugePairModel extends Equatable {
  final int id;
  final int languageFromId;
  final String languageFromName;
  final String languageFromCode;
  final String countryFromCode;
  final int languageToId;
  final String languageToName;
  final String languageToCode;
  final String countryToCode;

  const FreelancerLangaugePairModel({
    required this.id,
    required this.languageFromId,
    required this.languageFromName,
    required this.languageFromCode,
    required this.countryFromCode,
    required this.languageToId,
    required this.languageToName,
    required this.languageToCode,
    required this.countryToCode,
  });

  factory FreelancerLangaugePairModel.fromJson(Map<String, dynamic> map) {
    return FreelancerLangaugePairModel(
      id: map['id']?.toInt() ?? 0,
      languageFromId: map['languageFromId']?.toInt() ?? 0,
      languageFromName: map['languageFromName']?.toString() ?? '',
      languageFromCode: map['languageFromCode']?.toString() ?? '',
      countryFromCode: map['countryFromCode']?.toString() ?? '',
      languageToId: map['languageToId']?.toInt() ?? 0,
      languageToName: map['languageToName']?.toString() ?? '',
      languageToCode: map['languageToCode']?.toString() ?? '',
      countryToCode: map['countryToCode']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'languageFromId': languageFromId,
      'languageFromName': languageFromName,
      'languageFromCode': languageFromCode,
      'countryFromCode': countryFromCode,
      'languageToId': languageToId,
      'languageToName': languageToName,
      'languageToCode': languageToCode,
      'countryToCode': countryToCode,
    };
  }

  @override
  List<Object?> get props => [
        id,
        languageFromId,
        languageFromName,
        languageFromCode,
        countryFromCode,
        languageToId,
        languageToName,
        languageToCode,
        countryToCode,
      ];
}

