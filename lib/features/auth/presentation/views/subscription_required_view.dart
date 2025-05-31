import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/cache/cache_helper.dart';
import '../../../../core/helpers/custom_url_launcher.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_style.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/widgets/custom_app_bar.dart';
import '../../../../core/utils/widgets/custom_button.dart';

class SubscriptionRequiredView extends StatelessWidget {
  const SubscriptionRequiredView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(title: 'Subscription Required'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            SvgPicture.asset('assets/images/subscription.svg'),
            verticalSpace(20),
            Text(
              'You need to have an active subscription to access this feature.',
              textAlign: TextAlign.center,
              style: AppStyle.poppinsMedium15,
            ),
            Expanded(child: verticalSpace(20)),
            CustomButton(
              text: 'Subscribe',
              onPressed: () async {
                final token = CacheHelper.getSecuredString(AppConstants.token);
                await customUrlLauncher(
                  context,
                  'http://localhost:5173/select-plan/:$token',
                );
              },
            ),
            verticalSpace(20),
          ],
        ),
      ),
    );
  }
}
