import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/utils/widgets/custom_loading_widget.dart';
import '../../../../projects/presentation/logic/project_cubit/project_cubit.dart';
import '../../../../projects/presentation/logic/project_cubit/project_extenstion.dart';
import 'current_projects_chart.dart';
import '../../../../../core/utils/widgets/custom_failure_widget.dart';
import '../../../../../core/utils/widgets/custom_loading_widget.dart';
import '../../../../projects/data/models/project_statistics_model.dart';
import '../../../../projects/presentation/logic/project_cubit/project_cubit.dart';
import '../../../../projects/presentation/logic/project_cubit/project_extenstion.dart';
import 'current_projects_list_view.dart';
import 'freelancer_statistic_card.dart';

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
          'title': 'Accepted\nProjects',
          'projectNumber': statistics.acceptedProjects,
        };
      case 1:
        return {
          'title': 'Completed\nProjects',
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
            child: BlocBuilder<ProjectCubit, ProjectState>(
              buildWhen: (previous, current) => _buildWhen(current),
              builder: (context, state) {
                if (state.status.isGetCurrentProjectsStatisticsSuccess) {
                  return ListView.builder(
                    itemCount: 3,
                    padding: const EdgeInsets.only(left: 16, right: 6),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      return FreelancerStatisticCard(
                        title: cardData(state.statistics!, index)['title']!,
                        projectNumber: cardData(
                            state.statistics!, index)['projectNumber']!,
                        totalProjects: state.statistics!.acceptedProjects +
                            state.statistics!.activeProjects +
                            state.statistics!.inProgressProjects, 
                      );
                    },
                  );
                } else if (state.status.isGetCurrentProjectsStatisticsFailure) {
                  return CustomFailureWidget(text: state.errorMessage);
                }
                return const CustomLoadingWidget();
              },
            ),
          ),
        ),
        const SliverFillRemaining(
          child: CurrentProjectsListView(),
        ),
      ],
    );
  }

  bool _buildWhen(ProjectState state) {
    return state.status.isGetCurrentProjectsStatisticsSuccess ||
        state.status.isGetCurrentProjectsStatisticsFailure ||
        state.status.isGetCurrentProjectsStatisticsLoading;
  }
}
