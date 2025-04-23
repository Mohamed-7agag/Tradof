import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_style.dart';
import '../../data/model/subscription_model.dart';

class TimerOFdays extends StatelessWidget {
  const TimerOFdays({
    required this.subscription,
    super.key,
  });
  final SubscriptionModel subscription;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 16.w),
      decoration: const BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${subscription.remaining}',
                style: AppStyle.robotoCondensedSemiBold20,
              ),
              SvgPicture.asset('assets/images/timer.svg'),
            ],
          ),
          Text(
            'days',
            style: AppStyle.robotoCondensedRegular15,
          ),
        ],
      ),
    );
  }
}
