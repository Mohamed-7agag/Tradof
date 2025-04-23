import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/utils/widgets/custom_app_bar.dart';
import '../widgets/income_chart.dart';
import '../widgets/statistics_section.dart';

class FreelancerFinanceView extends StatelessWidget {
  const FreelancerFinanceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(title: 'Finances', titlePadding: 16),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            verticalSpace(20),
            const IncomeChart(),
            verticalSpace(20),
            const StatisticsSection(),
          ],
        ),
      ),
    );
  }
}
