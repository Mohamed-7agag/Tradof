import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:tradof/core/theming/app_colors.dart';
import 'package:tradof/features/projects/presentation/widgets/project_item.dart';

import '../../../../../core/helpers/spacing.dart';

class StartedProjectsSection extends StatelessWidget {
  const StartedProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: SingleChildScrollView(
        child: Column(
          children: [
            verticalSpace(40),
            Container(
              padding: EdgeInsets.only(top: 8.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColors.cardColor,
              ),
              child: SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                series: [
                  LineSeries<SalesData, String>(
                    color: AppColors.primary,
                    enableTrackball: true,
                    dataSource: [
                      SalesData('Jan', 5),
                      SalesData('Feb', 30),
                      SalesData('Mar', 14),
                      SalesData('Apr', 25),
                      SalesData('May', 10),
                      SalesData('Jun', 40),
                    ],
                    xValueMapper: (SalesData sales, _) => sales.year,
                    yValueMapper: (SalesData sales, _) => sales.sales,
                  ),
                ],
              ),
            ),
            verticalSpace(25),
            ProjectItem(),
            verticalSpace(12),
            ProjectItem(),
            verticalSpace(12),
            ProjectItem(),
            verticalSpace(100),
          ],
        ),
      ),
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}
