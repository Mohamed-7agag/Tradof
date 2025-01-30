import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tradof/core/helpers/spacing.dart';
import 'package:tradof/core/theming/app_colors.dart';
import 'package:tradof/core/theming/app_style.dart';
class Subscriptionplan extends StatelessWidget {
  const Subscriptionplan({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 81.h,
      width: 198.w,
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Subscription plan',
                  style: AppStyle.robotoCondensedRegular15,
                ),
                SvgPicture.asset('assets/images/convert_card.svg'),
              ],
            ),
            verticalSpace(15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Yearly Plan',
                  style: AppStyle.robotoCondensedRegular15,
                ),
                Text(
                  '500 EUR',
                  style: AppStyle.robotoCondensedMedium15
                      .copyWith(fontStyle: FontStyle.italic, fontSize: 12.sp),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
