import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/utils/widgets/custom_loading_widget.dart';
import '../../../../projects/presentation/logic/project_cubit/project_cubit.dart';
import '../../../../projects/presentation/logic/project_cubit/project_extenstion.dart';
import 'current_projects_chart.dart';
import 'current_projects_list_view.dart';

class CurrentProjectsSection extends StatelessWidget {
  const CurrentProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(child: verticalSpace(40)),
        SliverToBoxAdapter(
          child: BlocBuilder<ProjectCubit, ProjectState>(
            buildWhen: (previous, current) =>
                current.status.isGetStatisticsLoading ||
                current.status.isGetStatisticsSuccess ||
                current.status.isGetStatisticsFailure,
            builder: (context, state) {
              return state.status.isGetStatisticsLoading
                  ? const CustomLoadingWidget()
                  : SizedBox(
                      height: 120.h,
                      child: CurrentProjectsChart(
                        statistics: state.statistics!,
                      ),
                    );
            },
          ),
        ),
        const SliverFillRemaining(
          child: CurrentProjectsListView(),
        ),
      ],
    );
  }
}
