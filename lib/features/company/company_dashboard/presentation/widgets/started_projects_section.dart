import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tradof/features/projects/presentation/widgets/project_item.dart';

import '../../../../../core/helpers/spacing.dart';
import 'started_project_chart.dart';

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
            StartedProjectChart(),
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
