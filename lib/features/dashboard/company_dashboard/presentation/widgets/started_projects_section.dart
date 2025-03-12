import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/spacing.dart';
import 'started_project_chart.dart';

class StartedProjectsSection extends StatelessWidget {
  const StartedProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            verticalSpace(40),
            const StartedProjectChart(),
            verticalSpace(100),
          ],
        ),
      ),
    );
  }
}
