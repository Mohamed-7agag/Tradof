import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tradof/core/theming/app_colors.dart';


class LinkIcon extends StatelessWidget {
  const LinkIcon({
    super.key,
    required this.icon,
  });

  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45.w,
      height: 45.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: SvgPicture.asset(
        icon,
        width: 29.w,
        height: 29.h,
        fit: BoxFit.scaleDown,
      ),
    );
  }
}