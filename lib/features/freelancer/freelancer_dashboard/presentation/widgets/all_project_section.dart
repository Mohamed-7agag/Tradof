import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tradof/core/helpers/spacing.dart';

import '../../../../projects/presentation/widgets/project_item.dart';

class AllProjectsSection extends StatelessWidget {
  const AllProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            verticalSpace(40),
            ProjectItem(),
            verticalSpace(12),
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
