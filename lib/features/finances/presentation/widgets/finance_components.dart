import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/spacing.dart';
import 'income_chart.dart';
import 'statistics_section.dart';

class FinanceComponents extends StatelessWidget {
  const FinanceComponents({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            verticalSpace(50),
            const IncomeChart(),
            const StatisticsSection(),
            verticalSpace(100),
          ],
        ),
      ),
    );
  }
}
