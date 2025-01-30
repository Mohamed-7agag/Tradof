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
  });
  final String title;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 20.r,
        backgroundColor: AppColors.white,
        child: SvgPicture.asset(icon),
      ),
      title: Text(
        title,
        style: AppStyle.robotoCondensedRegular15,
      ),
      trailing: Icon(Icons.arrow_forward_ios),
    );
  }
}