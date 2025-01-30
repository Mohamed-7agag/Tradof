import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:tradof/core/theming/app_colors.dart';
import 'package:tradof/features/company/profile_company/presentation/widgets/rating.dart';
import 'package:tradof/features/company/profile_company/presentation/widgets/reviews.dart';

class RatingAndReviews extends StatelessWidget {
  const RatingAndReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Rating(),
          Reviews(),
          Container(
            width: 40.w,
            height: 43.h,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: SvgPicture.asset(
              'assets/images/share.svg',
              height: 18.h,
              width: 17.w,
              fit: BoxFit.scaleDown,
            ),
          )
        ],
      ),
    );
  }
}



