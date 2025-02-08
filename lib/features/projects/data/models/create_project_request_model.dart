import 'package:dio/dio.dart';

class CreateProjectRequestModel {
  final String projectName;
  final String description;
  final int days;
  final int fromLanguageId;
  final int toLanguageId;
  final int minPrice;
  final int maxPrice;
  final int specializationId;
  final List<MultipartFile> files;

  CreateProjectRequestModel({
    required this.projectName,
    required this.description,
    required this.days,
    required this.fromLanguageId,
    required this.toLanguageId,
    required this.minPrice,
    required this.maxPrice,
    required this.files,
    required this.specializationId,
  });

  Map<String, dynamic> toJson() => {
        'name': projectName,
        'description': description,
        'days': days,
        'languageFromId': fromLanguageId,
        'languageToId': toLanguageId,
        'minPrice': minPrice,
        'maxPrice': maxPrice,
        'specializationId': specializationId,
        'Files': files,
      };
}
