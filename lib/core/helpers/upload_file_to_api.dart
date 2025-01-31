import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';

Future uploadFileToApi(PlatformFile file) async {
  return MultipartFile.fromFile(
    file.path!,
    filename: file.path!.split('/').last,
  );
}
