import 'package:equatable/equatable.dart';

class LanguageModel extends Equatable {
  final int id;
  final String languageName;
  final String languageCode;
  final String countryName;
  final String countryCode;

  const LanguageModel({
    required this.id,
    required this.languageName,
    required this.languageCode,
    required this.countryName,
    required this.countryCode,
  });

  factory LanguageModel.fromJson(Map<String, dynamic> json) {
    return LanguageModel(
      id: json['id'],
      languageName: json['languageName'],
      languageCode: json['languageCode'],
      countryName: json['countryName'],
      countryCode: json['countryCode'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'languageName': languageName,
        'languageCode': languageCode,
        'countryName': countryName,
        'countryCode': countryCode,
      };

  @override
  List<Object?> get props =>
      [id, languageName, languageCode, countryName, countryCode];
}
