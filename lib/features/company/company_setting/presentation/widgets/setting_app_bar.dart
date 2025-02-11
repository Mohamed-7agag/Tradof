import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tradof/core/helpers/spacing.dart';
import 'package:tradof/core/theming/app_colors.dart';
import 'package:tradof/core/theming/app_style.dart';

class SettingAppbar extends StatelessWidget {
  const SettingAppbar({super.key});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primary,
      title: Text(
        'Setting',
        style: AppStyle.robotoBold20.copyWith(color: AppColors.white),
      ),
      actions: [
        SvgPicture.asset(
          'assets/images/setting.svg',
          colorFilter: const ColorFilter.mode(
            AppColors.white,
            BlendMode.srcIn,
          ),
        ),
        horizontalSpace(16),
      ],
      toolbarHeight: 65,
    );
  }
}
