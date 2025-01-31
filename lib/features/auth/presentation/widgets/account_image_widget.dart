import 'dart:developer';
import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/theming/app_colors.dart';

class AccountImageWidget extends StatefulWidget {
  const AccountImageWidget({super.key, required this.onImagePicked});
  final void Function(File? image) onImagePicked;
  @override
  State<AccountImageWidget> createState() => _AccountImageWidgetState();
}

class _AccountImageWidgetState extends State<AccountImageWidget> {
  File? _image;

  Future<void> _pickImageFromGallery() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        setState(() {
          _image = File(image.path);
          widget.onImagePicked(_image);
        });
      }
    } catch (e) {
      log('Error picking image: $e');
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
              onPressed: () {
                _pickImageFromGallery();
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
