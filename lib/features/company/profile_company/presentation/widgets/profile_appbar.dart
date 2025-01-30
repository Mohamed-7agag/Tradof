import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tradof/core/helpers/spacing.dart';
import 'package:tradof/core/theming/app_colors.dart';
import 'package:tradof/core/theming/app_style.dart';
import 'package:tradof/features/company/profile_company/presentation/widgets/user_image_and_info.dart';

class ProfileAppbar extends StatelessWidget {
  const ProfileAppbar({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 204.h,
      decoration: BoxDecoration(
        color: AppColors.primary,
      ),
      child: Column(
        children: [
          verticalSpace(64),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Row(
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
          ),
          verticalSpace(20),
          UserImageAndInfo()
        ],
      ),
    );
  }
}


