import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_style.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
      leading: CircleAvatar(
        radius: 24,
        backgroundColor: AppColors.white,
        backgroundImage: AssetImage('assets/images/photo3.jpg'),
      ),
      title: Text(
        'Youssef Ghareb',
        style: AppStyle.poppinsMedium14.copyWith(color: AppColors.white),
      ),
      subtitle: Text(
        'J0esph',
        style: AppStyle.robotoRegular10.copyWith(color: AppColors.white),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/bell2.png', width: 22),
          horizontalSpace(18),
          Image.asset('assets/images/calendar.png', width: 22),
          horizontalSpace(4),
        ],
      ),
    );
  }
}
