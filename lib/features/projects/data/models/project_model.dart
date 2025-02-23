import 'package:equatable/equatable.dart';

import '../../../../core/utils/models/language_model.dart';
import '../../../auth/data/model/specialization_model.dart';
import 'file_model.dart';
import 'status_model.dart';

class ProjectModel extends Equatable {
  final int id;
  final String name;
  final String description;
  final int days;
  final LanguageModel languageFrom;
  final LanguageModel languageTo;
  final int minPrice;
  final int maxPrice;
  final String? startDate;
  final String? endDate;
  final Status status;
  final SpecializationModel specialization;
  final int numberOfOffers;
  final List<FileModel> files;

  const ProjectModel({
    required this.id,
    required this.name,
    required this.description,
    required this.days,
    required this.languageFrom,
    required this.languageTo,
    required this.minPrice,
    required this.maxPrice,
    required this.startDate,
    required this.endDate,
    required this.status,
    required this.specialization,
    required this.numberOfOffers,
    required this.files,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      days: json['days'],
      languageFrom: LanguageModel.fromJson(json['languageFrom']),
      languageTo: LanguageModel.fromJson(json['languageTo']),
      minPrice: json['minPrice'],
      maxPrice: json['maxPrice'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      status: Status.fromJson(json['status']),
      specialization: SpecializationModel.fromJson(json['specialization']),
      numberOfOffers: json['numberOfOffers'],
      files: List<FileModel>.from(
        json['files'].map((x) => FileModel.fromJson(x)),
      ),
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        days,
        languageFrom,
        languageTo,
        minPrice,
        maxPrice,
        startDate,
        endDate,
        status,
        specialization,
        numberOfOffers,
        files,
      ];
}
