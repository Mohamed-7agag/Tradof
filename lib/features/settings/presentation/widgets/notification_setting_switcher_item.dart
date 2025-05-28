import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_style.dart';

class NotificationSettingSwitcherItem extends StatelessWidget {
  const NotificationSettingSwitcherItem({
    required this.title,
    required this.subTitle,
    required this.onChanged,
    required this.value,
    super.key,
  });
  final String title;
  final String subTitle;
  final Function(bool) onChanged;
  final bool value;
  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: value,
      onChanged: onChanged,
      contentPadding: EdgeInsets.zero,
      activeColor: AppColors.primary,
      title: Text(
        title,
        style: AppStyle.poppinsMedium14.copyWith(fontSize: 13.sp),
      ),
      subtitle: Text(
        subTitle,
        style: AppStyle.robotoRegular10,
      ),
    );
  }
}
