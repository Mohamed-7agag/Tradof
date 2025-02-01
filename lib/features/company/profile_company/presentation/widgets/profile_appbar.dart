import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tradof/core/helpers/spacing.dart';
import 'package:tradof/core/theming/app_colors.dart';
import 'package:tradof/core/theming/app_style.dart';

import 'user_image_and_info.dart';

class ProfileAppbar extends StatelessWidget {
  const ProfileAppbar({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: AppColors.primary,
      ),
      child: SafeArea(
        child: Column(
          children: [
            verticalSpace(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Profile',
                  style: AppStyle.robotoBold20
                      .copyWith(color: AppColors.white, fontSize: 22.sp),
                ),
                SvgPicture.asset('assets/images/user.svg')
              ],
            ),
            verticalSpace(10),
            UserImageAndInfo(),
            verticalSpace(12),
          ],
        ),
      ),
    );
  }
}
