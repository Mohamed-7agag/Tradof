import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_style.dart';

class SettingItem extends StatelessWidget {
  const SettingItem({
    required this.title,
    required this.icon,
    required this.onTap,
    super.key,
  });
  final String title;
  final Widget icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.only(right: 6),
      leading: CircleAvatar(
        radius: 21.r,
        backgroundColor: AppColors.white,
        child: icon,
      ),
      title: Text(
        title,
        style: AppStyle.robotoCondensedRegular15,
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios_rounded,
        size: 18,
        color: AppColors.primary,
      ),
    );
  }
}
