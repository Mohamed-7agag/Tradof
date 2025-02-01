import 'package:flutter/material.dart';
import 'package:tradof/features/company/company_setting/presentation/widgets/subscription_plan.dart';
import 'package:tradof/features/company/company_setting/presentation/widgets/timer.dart';

import '../../../../../core/helpers/spacing.dart';

class SubscriptionPlanAndTimer extends StatelessWidget {
  const SubscriptionPlanAndTimer({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Subscriptionplan(),
          ),
          horizontalSpace(10),
          Expanded(
            flex: 3,
            child: TimerOFdays(),
          ),
        ],
      ),
    );
  }
}
