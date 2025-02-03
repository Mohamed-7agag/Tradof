import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tradof/core/theming/app_colors.dart';
import 'package:tradof/core/theming/app_style.dart';

class SettingItem extends StatelessWidget {
  const SettingItem({
    super.key,
    required this.title,
    required this.icon, 
   required this.onTap,
  });
  final String title;
  final String icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.only(right: 6),
      leading: CircleAvatar(
        radius: 21.r,
        backgroundColor: AppColors.white,
        child: SvgPicture.asset(icon),
      ),
      title: Text(
        title,
        style: AppStyle.robotoCondensedRegular15,
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        size: 20,
        color: AppColors.primary,
      ),
    );
  }
}
