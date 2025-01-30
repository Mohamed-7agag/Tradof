import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tradof/core/helpers/spacing.dart';
import 'package:tradof/core/theming/app_colors.dart';
import 'package:tradof/core/theming/app_style.dart';
class Rating extends StatelessWidget {
  const Rating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 135.w,
      height: 43.h,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Rating',
                style: AppStyle.robotoMedium10.copyWith(
                  color: AppColors.white,
                ),
              ),
              verticalSpace(10),
            ],
          ),
          Row(
            children: [
              Text(
                '1500',
                style: AppStyle.robotoSemiBold12
                    .copyWith(color: AppColors.white, fontSize: 18.sp),
              ),
              Icon(
                Icons.star,
                color: Colors.yellow,
              )
            ],
          ),
        ],
      ),
    );
  }
}
