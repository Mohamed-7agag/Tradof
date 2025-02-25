import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';

import 'upload_file_to_api.dart';
/// convert PlatformFile to MultipartFile
Future<List<MultipartFile>> prepareFiles(List<PlatformFile>? files) {
  if (files == null) return Future.value([]);
  final convertedFiles =
      files.map((file) async => await uploadFileToApi(file)).toList();
  return Future.wait(convertedFiles);
}
