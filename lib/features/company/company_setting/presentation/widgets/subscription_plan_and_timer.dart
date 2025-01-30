
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tradof/features/company/company_setting/presentation/widgets/subscription_plan.dart';
import 'package:tradof/features/company/company_setting/presentation/widgets/timer.dart';

class SubscriptionPlanAndTimer extends StatelessWidget {
  const SubscriptionPlanAndTimer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Subscriptionplan(),
          TimerOFdays(),
        ],
      ),
    );
  }
}
