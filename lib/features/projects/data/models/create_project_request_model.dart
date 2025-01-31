import 'package:dio/dio.dart';

class CreateProjectRequestModel {
  final String projectName;
  final String description;
  final String deliveryDate;
  final int fromLanguageId;
  final int toLanguageId;
  final int minPrice;
  final int maxPrice;
  final List<MultipartFile> files;

  CreateProjectRequestModel({
    required this.projectName,
    required this.description,
    required this.deliveryDate,
    required this.fromLanguageId,
    required this.toLanguageId,
    required this.minPrice,
    required this.maxPrice,
    required this.files,
  });

  Map<String, dynamic> toJson() => {
        'name': projectName,
        'description': description,
        'deliveryDate': deliveryDate, //
        'languageFromId': fromLanguageId,
        'languageToId': toLanguageId,
        'minPrice': minPrice,
        'maxPrice': maxPrice,
        'files': files, //
      };
}
