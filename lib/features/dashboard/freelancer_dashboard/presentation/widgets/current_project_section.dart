import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/spacing.dart';
import 'current_projects_list_view.dart';

class CurrentProjectsSection extends StatefulWidget {
  const CurrentProjectsSection({super.key});

  @override
  State<CurrentProjectsSection> createState() => _CurrentProjectsSectionState();
}

class _CurrentProjectsSectionState extends State<CurrentProjectsSection> {
  Map<String, dynamic> cardData(ProjectStatisticsModel statistics, int index) {
    switch (index) {
      case 0:
        return {
          'title': 'Active\nProjects',
          'projectNumber': statistics.activeProjects,
        };
      case 1:
        return {
          'title': 'InProgress\nProjects',
          'projectNumber': statistics.inProgressProjects,
        };
      case 2:
        return {
          'title': 'Finished\nProjects',
          'projectNumber': statistics.acceptedProjects,
        };
      default:
        return {};
    }
  }

  @override
  void initState() {
    super.initState();
    context.read<ProjectCubit>().getCurrentProjectsStatistics();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(child: verticalSpace(40)),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 120.h,
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (_, index) => const FreelancerStatisticCard(),
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
            ),
          ),
        ),
        const SliverFillRemaining(
          child: CurrentProjectsListView(),
        ),
      ],
    );
  }
}