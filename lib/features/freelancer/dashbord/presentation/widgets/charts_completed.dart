import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:tradof/core/theming/app_colors.dart';
import 'package:tradof/core/theming/app_style.dart';

class CompleteProjectsCard extends StatelessWidget {
  const CompleteProjectsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 325.w,
      height: 123.h,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(30.r),
      ),
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Complete\nProjects",
                style: AppStyle.robotoBlack15.copyWith(color: Colors.white),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.task_alt, color: Colors.green, size: 18),
                  SizedBox(width: 6),
                  Text(
                    "10 from total 20",
                    style:
                        AppStyle.robotoRegular10.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
          CircularPercentIndicator(
            startAngle: 120,
            radius: 40.r,
            lineWidth: 10.0,
            percent: 0.5525,
            center: Text(
              "55.25%",
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
