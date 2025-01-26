import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/theming/app_colors.dart';

class AccountImageWidget extends StatefulWidget {
  const AccountImageWidget({super.key});

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
              width: 85,
              height: 85,
              fit: BoxFit.fill,
            ),
          )
        : SvgPicture.asset('assets/images/person.svg');
  }
}
