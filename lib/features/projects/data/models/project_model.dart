import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

class ProjectModel extends Equatable {
  final String projectName;
  final String description;
  final int days;
  final int fromLanguageId;
  final int toLanguageId;
  final int minPrice;
  final int maxPrice;
  final int specializationId;
  final List<MultipartFile> files;

  const ProjectModel({
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

  @override
  List<Object?> get props => [
        projectName,
        description,
        days,
        fromLanguageId,
        toLanguageId,
        minPrice,
        maxPrice,
        specializationId,
        files,
      ];
}
