import 'package:equatable/equatable.dart';

class FileModel extends Equatable {
  final String fileName;
  final String filePath;
  final int fileType;
  final int fileSize;

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

  @override
  List<Object?> get props => [
        fileName,
        filePath,
        fileType,
        fileSize,
      ];
}