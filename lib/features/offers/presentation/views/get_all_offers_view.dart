import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/utils/widgets/custom_app_bar.dart';
import '../widgets/all_offer_section.dart';

class GetAllOffersView extends StatelessWidget {
  const GetAllOffersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        customAppbar(
          title: 'Your Offers',
          actionIcon: HugeIcons.strokeRoundedPenToolAdd,
          titlePadding: 16.w,
        ),
        verticalSpace(16),
        const Expanded(
          child: AllOfferSection(),
        ),
      ],
    );
  }
}
