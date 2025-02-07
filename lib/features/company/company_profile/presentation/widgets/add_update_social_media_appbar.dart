import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tradof/core/helpers/spacing.dart';
import 'package:tradof/core/theming/app_colors.dart';
import 'package:tradof/core/theming/app_style.dart';

class AddUpdateSocialMediaAppbar extends StatelessWidget {
  const AddUpdateSocialMediaAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.white,
      leadingWidth: 40,
      title: Text(
        'Social Media',
        style: AppStyle.robotoBold20,
      ),
      actions: [
        SvgPicture.asset(
          'assets/images/edit.svg',
          width: 24,
        ),
        horizontalSpace(16),
      ],
      toolbarHeight: 65,
    );
  }
}