import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import 'freelancer_statistic_card.dart';

class CurrentProjectsSection extends StatelessWidget {
  const CurrentProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          verticalSpace(40),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(3, (index) {
                return Padding(
                  padding: EdgeInsets.only(left: index == 0 ? 8 : 0),
                  child: const FreelancerStatisticCard(),
                );
              }),
            ),
          ),
          verticalSpace(25),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: const Column(),
          ),
          verticalSpace(100),
        ],
      ),
    );
  }
}
