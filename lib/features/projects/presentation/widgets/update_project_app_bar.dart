import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tradof/core/helpers/spacing.dart';
import 'package:tradof/core/theming/app_colors.dart';
import 'package:tradof/core/theming/app_style.dart';

class UpdateProjectAppbar extends StatelessWidget {
  const UpdateProjectAppbar({super.key});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primary,
      title: Text(
        'Update Project',
        style: AppStyle.robotoBold20.copyWith(color: AppColors.white),
      ),
      actions: [
        SvgPicture.asset('assets/images/edit.svg', width: 24),
        horizontalSpace(16),
      ],
      toolbarHeight: 65,
    );
  }
}
