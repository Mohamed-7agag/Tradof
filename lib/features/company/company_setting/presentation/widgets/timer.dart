import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:tradof/core/theming/app_colors.dart';
import 'package:tradof/core/theming/app_style.dart';

class TimerOFdays extends StatelessWidget {
  const TimerOFdays({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 81.h,
      width: 123.w,
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '250',
                  style:
                      AppStyle.robotoCondensedSemiBold32.copyWith(fontSize: 20),
                ),
                Text(
                  'days',
                  style: AppStyle.robotoCondensedRegular15,
                )
              ],
            ),
            SvgPicture.asset('assets/images/timer.svg'),
          ],
        ),
      ),
    );
  }
}
