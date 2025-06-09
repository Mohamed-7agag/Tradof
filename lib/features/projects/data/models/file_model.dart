import 'package:equatable/equatable.dart';

class FileModel extends Equatable {
  final String fileName;
  final String filePath;
  final int fileType;
  final int fileSize;
  final int id;

  const FileModel({
    required this.fileName,
    required this.filePath,
    required this.fileType,
    required this.fileSize,
    required this.id,
  });

  factory FileModel.fromJson(Map<String, dynamic> json) {
    return FileModel(
      fileName: json['fileName'],
      filePath: json['filePath'],
      fileType: json['fileType'],
      id: json['id'],
      fileSize: json['fileSize'],
    );
  }

  @override
  List<Object?> get props => [
        fileName,
        filePath,
        fileType,
        fileSize,
      ];
}