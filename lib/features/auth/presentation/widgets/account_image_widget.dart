import 'dart:developer';
import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/theming/app_colors.dart';
import '../logic/registeration_cubit/registeration_cubit.dart';

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
          context
              .read<RegisterationCubit>()
              .setRegisterationData(imageProfile: _image);
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
              onPressed: _pickImageFromGallery,
              icon: const HugeIcon(
                icon: HugeIcons.strokeRoundedCamera01,
                color: AppColors.white,
                size: 22,
              ),
              style: IconButton.styleFrom(
                backgroundColor: AppColors.lightOrange,
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
              width: 88,
              height: 88,
              fit: BoxFit.cover,
            ),
          )
        : SlideInLeft(
            from: 400,
            child: SvgPicture.asset('assets/images/person.svg', width: 85),
          );
  }
}
