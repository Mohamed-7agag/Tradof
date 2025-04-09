import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/spacing.dart';
import 'current_projects_list_view.dart';
import 'freelancer_statistic_card.dart';

class CurrentProjectsSection extends StatelessWidget {
  const CurrentProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(child: verticalSpace(40)),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 120.h,
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (_, index) => const FreelancerStatisticCard(),
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
            ),
          ),
        ),
        const SliverFillRemaining(
          child: CurrentProjectsListView(),
        ),
      ],
    );
  }
}