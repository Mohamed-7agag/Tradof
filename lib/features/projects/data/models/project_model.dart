import 'package:equatable/equatable.dart';

class ProjectModel extends Equatable {

  const ProjectModel({
    required this.id,
    required this.name,
    required this.description,
    required this.days,
    required this.languageFromId,
    required this.languageToId,
    required this.minPrice,
    required this.maxPrice,
    required this.startDate,
    required this.endDate,
    required this.status,
    required this.specializationId,
    required this.numberOfOffers,
    required this.files,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      days: json['days'],
      languageFromId: json['languageFromId'],
      languageToId: json['languageToId'],
      minPrice: json['minPrice'],
      maxPrice: json['maxPrice'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      status: json['status'],
      specializationId: json['specializationId'],
      numberOfOffers: json['numberOfOffers'],
      files: List<FileModel>.from(
        json['files'].map((x) => FileModel.fromJson(x)),
      ),
    );
  }
  final int id;
  final String name;
  final String description;
  final int days;
  final int languageFromId;
  final int languageToId;
  final int minPrice;
  final int maxPrice;
  final String? startDate;
  final String? endDate;
  final int status;
  final int specializationId;
  final int numberOfOffers;
  final List<FileModel> files;

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        days,
        languageFromId,
        languageToId,
        minPrice,
        maxPrice,
        startDate,
        endDate,
        status,
        specializationId,
        numberOfOffers,
        files,
      ];
}

class FileModel extends Equatable {

  const FileModel({
    required this.fileName,
    required this.filePath,
    required this.fileType,
    required this.fileSize,
  });

  factory FileModel.fromJson(Map<String, dynamic> json) {
    return FileModel(
      fileName: json['file_name'],
      filePath: json['file_path'],
      fileType: json['file_type'],
      fileSize: json['file_size'],
    );
  }
  final String fileName;
  final String filePath;
  final int fileType;
  final int fileSize;

  @override
  List<Object?> get props => [
        fileName,
        filePath,
        fileType,
        fileSize,
      ];
}
