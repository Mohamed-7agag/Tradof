import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';

Future<String> uploadImageToCloudinary(File? image) async {
  if (image == null) return '';

  const cloudinaryUrl = 'https://api.cloudinary.com/v1_1/dbzgz8bis/upload';
  const uploadPreset = 'tradof-images';

  try {
    FormData formData = FormData.fromMap({
      'upload_preset': uploadPreset,
      'file': await MultipartFile.fromFile(image.path),
    });

    Dio dio = Dio();
    Response response = await dio.post(cloudinaryUrl, data: formData);

    if (response.statusCode == 200) {
      final jsonMap = response.data;
      return jsonMap['url'];
    } else {
      log('Error: ${response.statusCode} - ${response.statusMessage}');
      return '';
    }
  } catch (e) {
    log('Upload failed: $e');
    return '';
  }
}
