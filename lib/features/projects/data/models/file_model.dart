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
      fileName: json['fileName'],
      filePath: json['filePath'],
      fileType: json['fileType'],
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