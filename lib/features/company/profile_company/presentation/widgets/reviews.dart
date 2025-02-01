import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:tradof/core/helpers/spacing.dart';
import 'package:tradof/core/theming/app_colors.dart';
import 'package:tradof/core/theming/app_style.dart';

class Reviews extends StatelessWidget {
  const Reviews({
    super.key,
    required this.reviews,
  });

  final int reviews;

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
                'Reviews',
                style: AppStyle.robotoMedium10.copyWith(
                  color: AppColors.white,
                ),
              ),
              verticalSpace(10),
            ],
          ),
          Text(
            '$reviews',
            style: AppStyle.robotoSemiBold12
                .copyWith(color: AppColors.white, fontSize: 18.sp),
          ),
        ],
      ),
    );
  }
}
