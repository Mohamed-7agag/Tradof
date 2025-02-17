import 'package:flutter/material.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../projects/presentation/widgets/project_item.dart';
import 'started_project_chart.dart';

class StartedProjectsSection extends StatelessWidget {
  const StartedProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          verticalSpace(40),
          const StartedProjectChart(),
          verticalSpace(25),
          const ProjectItem(),
          verticalSpace(12),
          const ProjectItem(),
          verticalSpace(12),
          const ProjectItem(),
          verticalSpace(100),
        ],
      ),
    );
  }
}
