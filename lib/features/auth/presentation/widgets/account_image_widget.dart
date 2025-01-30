import 'dart:developer';
import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/theming/app_colors.dart';

class AccountImageWidget extends StatefulWidget {
  const AccountImageWidget({super.key, required this.onImagePicked});
  final void Function(String? imageUrl) onImagePicked;
  @override
  State<AccountImageWidget> createState() => _AccountImageWidgetState();
}

class _AccountImageWidgetState extends State<AccountImageWidget> {
  File? _image;
  String? imageUrl;
  
  Future<void> _pickImageFromGallery() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        setState(() {
          _image = File(image.path);
        });
      }
    } catch (e) {
      log('Error picking image: $e');
    }
  }

  Future<void> _uploadImage() async {
    if (_image == null) return;

    const cloudinaryUrl = 'https://api.cloudinary.com/v1_1/dbzgz8bis/upload';
    const uploadPreset = 'tradof-images';

    try {
      FormData formData = FormData.fromMap({
        'upload_preset': uploadPreset,
        'file': await MultipartFile.fromFile(_image!.path),
      });

      Dio dio = Dio();
      Response response = await dio.post(cloudinaryUrl, data: formData);

      if (response.statusCode == 200) {
        final jsonMap = response.data;
        setState(() {
          imageUrl = jsonMap['url'];
          widget.onImagePicked(imageUrl);
        });
      } else {
        log('Error: ${response.statusCode} - ${response.statusMessage}');
      }
    } catch (e) {
      log('Upload failed: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      clipBehavior: Clip.none,
      children: [
        userImage(),
        Positioned(
          bottom: -10,
          right: -10,
          child: SlideInRight(
            from: 400,
            child: IconButton(
              onPressed: () async {
                await _pickImageFromGallery();
                _uploadImage();
              },
              icon: Icon(
                Icons.camera_alt,
                color: AppColors.lightOrange,
              ),
              style: IconButton.styleFrom(
                backgroundColor: AppColors.white,
                shadowColor: AppColors.grey,
                elevation: 0.01,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget userImage() {
    return _image != null
        ? ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.file(
              _image!,
              width: 90,
              height: 90,
              fit: BoxFit.contain,
            ),
          )
        : SlideInLeft(
            from: 400,
            child: SvgPicture.asset('assets/images/person.svg', width: 90));
  }
}
