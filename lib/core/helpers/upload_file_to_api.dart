import 'dart:io';

import 'package:dio/dio.dart';

Future uploadFileToApi(File file) async {
  return MultipartFile.fromFile(
    file.path,
    filename: file.path.split('/').last,
  );
}
