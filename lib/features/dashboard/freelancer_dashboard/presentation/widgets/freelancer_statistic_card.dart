import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_style.dart';

class FreelancerStatisticCard extends StatelessWidget {
  const FreelancerStatisticCard({
    required this.title,
    required this.projectNumber,
    required this.totalProjects,
    super.key,
  });
  final String title;
  final int projectNumber;
  final int totalProjects;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.85.sw,
      padding: const EdgeInsets.only(top: 12, bottom: 20),
      margin: EdgeInsets.only(right: 8.w),
      decoration: const BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.all(Radius.circular(24)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: AppStyle.robotoBlack15.copyWith(color: Colors.white),
              ),
              verticalSpace(8),
              Row(
                children: [
                  const Icon(Icons.task_alt, color: Colors.green, size: 18),
                  horizontalSpace(6),
                  Text(
                    "$projectNumber from total $totalProjects",
                    style: AppStyle.robotoRegular10.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
          CircularPercentIndicator(
            radius: 45,
            lineWidth: 8.0,
            percent: countPercentage() == 0.0 ? 1.0 : countPercentage(),
            animation: true,
            center: Text(
              "${(countPercentage() * 100).toStringAsFixed(1)}%",
              style: AppStyle.robotoBlack15.copyWith(color: Colors.white),
            ),
            progressColor:
                countPercentage() == 0.0 ? Colors.grey : AppColors.lightOrange,
            backgroundColor: Colors.transparent,
            circularStrokeCap: CircularStrokeCap.round,
          ),
        ],
      ),
    );
  }

  double countPercentage() {
    return totalProjects == 0 ? 0.0 : projectNumber / totalProjects;
  }
}
