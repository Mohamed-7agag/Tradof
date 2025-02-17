import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../helpers/spacing.dart';
import '../../theming/app_colors.dart';
import '../../theming/app_style.dart';

AppBar customAppbar({required String title, IconData? actionIcon}) {
  return AppBar(
    title: Text(title, style: AppStyle.robotoBold20),
    actions: actionIcon != null
        ? [
            HugeIcon(
              icon: actionIcon,
              color: AppColors.white,
              size: 26,
            ),
            horizontalSpace(16),
          ]
        : null,
    toolbarHeight: 65,
    backgroundColor: AppColors.primary,
    foregroundColor: AppColors.white,
    leadingWidth: 40,
  );
}
