import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/spacing.dart';
import 'started_project_chart.dart';
import 'started_projects_list_view.dart';

class StartedProjectsSection extends StatelessWidget {
  const StartedProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(child: verticalSpace(40)),
            const SliverToBoxAdapter(child: StartedProjectChart()),
          ];
        },
        body: Column(
          children: [
            const Expanded(
              child: StartedProjectsListView(),
            ),
            verticalSpace(50),
          ],
        ),
      ),
    );
  }
}
