import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../core/utils/widgets/custom_app_bar.dart';
import '../widgets/all_offer_section.dart';
import '../widgets/fliter_list_view.dart';

class GetAllOffersView extends StatelessWidget {
  const GetAllOffersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        customAppbar(
          title: 'My Offers',
          actionIcon: HugeIcons.strokeRoundedClipboard,
          titlePadding: 16.w,
        ),
        const Expanded(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: FliterListView(),
              ),
              SliverFillRemaining(
                child: AllOfferSection(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
