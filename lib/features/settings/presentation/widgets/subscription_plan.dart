import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_style.dart';
import '../../data/model/subscription_model.dart';

class Subscriptionplan extends StatelessWidget {
  const Subscriptionplan({
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
                'Subscription plan',
                style: AppStyle.robotoCondensedRegular15,
              ),
              const HugeIcon(
                icon: HugeIcons.strokeRoundedCardExchange02,
                color: Colors.black,
                size: 22,
              ),
            ],
          ),
          verticalSpace(12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                subscription.packageName,
                style: AppStyle.robotoCondensedRegular15,
              ),
              Text(
                '${subscription.price} EGP',
                style: AppStyle.robotoCondensedMedium12
                    .copyWith(fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
