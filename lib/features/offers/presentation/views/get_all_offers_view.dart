import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:lazy_load_indexed_stack/lazy_load_indexed_stack.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/utils/widgets/custom_app_bar.dart';
import '../widgets/all_offer_section.dart';

class GetAllOffersView extends StatelessWidget {
  GetAllOffersView({super.key});
  final ValueNotifier<int> currentIndexNotifier = ValueNotifier<int>(0);

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
        Expanded(
          child: ValueListenableBuilder<int>(
            valueListenable: currentIndexNotifier,
            builder: (context, currentIndex, child) {
              return LazyLoadIndexedStack(
                index: currentIndex,
                children: const [
                  AllOfferSection(),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
