import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'started_projects_list_view.dart';

class StartedProjectsSection extends StatelessWidget {
  const StartedProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: const StartedProjectsListView(),
    );
  }
}
