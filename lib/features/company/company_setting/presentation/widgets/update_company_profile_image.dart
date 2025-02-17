import 'dart:developer';
import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/theming/app_colors.dart';
import '../logic/company_setting_cubit/company_setting_cubit.dart';

class UpdateCompanyProfileImage extends StatefulWidget {
  const UpdateCompanyProfileImage({super.key, this.imageUrl});
  final String? imageUrl;
  @override
  State<UpdateCompanyProfileImage> createState() =>
      _UpdateCompanyProfileImageState();
}

class _UpdateCompanyProfileImageState extends State<UpdateCompanyProfileImage> {
  File? _image;

  Future<void> _pickImageFromGallery() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        setState(() {
          _image = File(image.path);
          context
              .read<CompanySettingCubit>()
              .setImageProfileAndCountryId(image: _image);
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
                color: AppColors.lightOrange,
                size: 22,
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
            child: widget.imageUrl == null
                ? SvgPicture.asset('assets/images/person.svg', width: 90)
                : ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: CachedNetworkImage(
                      imageUrl: widget.imageUrl!,
                      width: 90,
                      height: 90,
                      fit: BoxFit.contain,
                    ),
                  ),
          );
  }
}
