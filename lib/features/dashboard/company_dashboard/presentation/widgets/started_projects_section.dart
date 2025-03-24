import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../projects/presentation/logic/project_cubit/project_cubit.dart';
import 'started_project_chart.dart';
import 'started_projects_list_view.dart';

class StartedProjectsSection extends StatefulWidget {
  const StartedProjectsSection({super.key});

  @override
  State<StartedProjectsSection> createState() => _StartedProjectsSectionState();
}

class _StartedProjectsSectionState extends State<StartedProjectsSection> {
  @override
  void initState() {
    if (context.read<ProjectCubit>().state.startedProjects.isEmpty) {
      context.read<ProjectCubit>().getStartedProjects();
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: verticalSpace(40)),
          const SliverToBoxAdapter(
            child: StartedProjectChart(),
          ),
          SliverToBoxAdapter(child: verticalSpace(20)),
          const StartedProjectsListView(),
        ],
      ),
    );
  }
}
