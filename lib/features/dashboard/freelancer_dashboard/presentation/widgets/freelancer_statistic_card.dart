import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_style.dart';

class FreelancerStatisticCard extends StatelessWidget {
  const FreelancerStatisticCard({
    required this.totalProjects,
    required this.projects,
    required this.title,
    super.key,
  });
  final num totalProjects;
  final num projects;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.85.sw,
      padding: const EdgeInsets.only(top: 12, bottom: 20),
      margin: EdgeInsets.only(right: 8.w),
      decoration: const BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.all(Radius.circular(30)),
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
                    "$projects from total $totalProjects",
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
            lineWidth: 9.0,
            percent: totalProjects == 0 ? 0 : projects / totalProjects,
            animation: true,
            center: totalProjects == 0
                ? Text(
                    "Not Found",
                    style: AppStyle.robotoBlack15.copyWith(color: Colors.white),
                  )
                : Text(
                    "${((projects / totalProjects) * 100).round()}%",
                    style: AppStyle.robotoBlack15.copyWith(color: Colors.white),
                  ),
            progressColor: AppColors.lightOrange,
            backgroundColor: Colors.transparent,
            circularStrokeCap: CircularStrokeCap.round,
          ),
        ],
      ),
    );
  }
}
