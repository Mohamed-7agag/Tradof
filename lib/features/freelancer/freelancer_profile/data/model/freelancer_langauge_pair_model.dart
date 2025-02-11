import 'package:equatable/equatable.dart';

class FreelancerLangaugePairModel extends Equatable {
  final int id;
  final int languageFromId;
  final String languageFromName;
  final int languageToId;
  final String languageToName;

  const FreelancerLangaugePairModel({
    required this.id,
    required this.languageFromId,
    required this.languageFromName,
    required this.languageToId,
    required this.languageToName,
  });

  factory FreelancerLangaugePairModel.fromJson(Map<String, dynamic> map) {
    return FreelancerLangaugePairModel(
      id: map['id']?.toInt() ?? 0,
      languageFromId: map['languageFromId']?.toInt() ?? 0,
      languageFromName: map['languageFromName']?.toString() ?? '',
      languageToId: map['languageToId']?.toInt() ?? 0,
      languageToName: map['languageToName']?.toString() ?? '',
    );
  }

  Map<String, dynamic> tojson() {
    return {
      'id': id,
      'languageFromId': languageFromId,
      'languageFromName': languageFromName,
      'languageToId': languageToId,
      'languageToName': languageToName,
    };
  }

  @override
  List<Object?> get props => [
        id,
        languageFromId,
        languageFromName,
        languageToId,
        languageToName,
      ];
}
