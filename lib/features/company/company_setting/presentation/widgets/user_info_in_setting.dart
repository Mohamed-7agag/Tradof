import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tradof/core/helpers/spacing.dart';
import 'package:tradof/core/theming/app_colors.dart';
import 'package:tradof/core/theming/app_style.dart';

class UserInfoInSetting extends StatelessWidget {
  const UserInfoInSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 81.h,
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 30.w, right: 15.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(53),
                  child: SizedBox(
                    width: 55.w,
                    height: 55.h,
                    child: Image.asset('assets/images/photo3.jpg'),
                  ),
                ),
                horizontalSpace(15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Youssef Ghareb',
                      style: AppStyle.robotoSemiBold12
                          .copyWith(color: AppColors.black, fontSize: 13.sp),
                    ),
                    Text('youssef.ghareb@tradof.com',
                        style: AppStyle.robotoRegular10),
                    Text('Company',
                        style: AppStyle.robotoRegular10
                            .copyWith(fontSize: 8.sp)),
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/images/online.svg'),
                verticalSpace(30),
              ],
            )
          ],
        ),
      ),
    );
  }
}
