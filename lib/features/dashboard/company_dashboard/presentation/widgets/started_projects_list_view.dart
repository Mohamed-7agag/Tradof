import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/widgets/custom_failure_widget.dart';
import '../../../../../core/utils/widgets/custom_loading_widget.dart';
import '../../../../projects/presentation/logic/project_cubit/project_cubit.dart';
import '../../../../projects/presentation/logic/project_cubit/project_extenstion.dart';
import '../../../../projects/presentation/widgets/project_item.dart';

class StartedProjectsListView extends StatelessWidget {
  const StartedProjectsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectCubit, ProjectState>(
      buildWhen: (previous, current) => _buildWhen(current),
      builder: (context, state) {
        if (state.status.isGetStartedtProjectsSuccess) {
          return SliverList.builder(
            itemCount: state.startedProjects.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: ProjectItem(
                project: state.startedProjects[index],
                onTap: () {},
              ),
            ),
          );
        } else if (state.status.isGetStartedtProjectsFailure) {
          return SliverToBoxAdapter(
            child: CustomFailureWidget(text: state.errorMessage),
          );
        }
        return const SliverToBoxAdapter(
          child: CustomLoadingWidget(),
        );
      },
    );
  }

  bool _buildWhen(ProjectState state) =>
      state.status.isGetStartedtProjectsSuccess ||
      state.status.isGetStartedtProjectsFailure ||
      state.status.isGetStartedtProjectsLoading;
}
