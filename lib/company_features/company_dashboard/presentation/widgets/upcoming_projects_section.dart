import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/utils/widgets/custom_failure_widget.dart';
import '../../../../core/utils/widgets/custom_loading_widget.dart';
import '../../../../core/utils/widgets/custom_refresh_indicator.dart';
import '../../../../shared_features/projects/data/models/project_model.dart';
import '../../../../shared_features/projects/presentation/logic/project_cubit/project_cubit.dart';
import '../../../../shared_features/projects/presentation/widgets/project_item.dart';
import '../../../company_profile/data/model/company_model.dart';

class UpcomingProjectsSection extends StatefulWidget {
  const UpcomingProjectsSection({required this.companyModel, super.key});
  final CompanyModel companyModel;

  @override
  State<UpcomingProjectsSection> createState() =>
      _UpcomingProjectsSectionState();
}

class _UpcomingProjectsSectionState extends State<UpcomingProjectsSection> {
  @override
  void initState() {
    if (context.read<ProjectCubit>().state.upcomingProjects.isEmpty) {
      context.read<ProjectCubit>().getUpcomingProjects();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectCubit, ProjectState>(
      builder: (context, state) {
        return CustomRefreshIndicator(
          onRefresh: () async {
            context.read<ProjectCubit>().getUpcomingProjects();
          },
          child: state.status.isGetUpcomingProjectsSuccess
              ? BuildUpcomingProjects(
                  companyModel: widget.companyModel,
                  projects: state.upcomingProjects,
                )
              : state.status.isGetUpcomingProjectsFailure
                  ? ListView(
                      itemExtent: 0.7.sh,
                      children: [
                        CustomFailureWidget(text: state.errorMessage),
                      ],
                    )
                  : const CustomLoadingWidget(),
        );
      },
    );
  }
}

class BuildUpcomingProjects extends StatelessWidget {
  const BuildUpcomingProjects({
    required this.companyModel,
    required this.projects,
    super.key,
  });

  final CompanyModel companyModel;
  final List<ProjectModel> projects;

  @override
  Widget build(BuildContext context) {
    return projects.isEmpty
        ? const CustomFailureWidget(text: 'No Projects Found')
        : ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(top: 40, bottom: 100),
            itemCount: projects.length,
            itemBuilder: (BuildContext context, int index) {
              return ProjectItem(
                project: projects[index],
                onTap: () async {
                  final result = await context.pushNamed(
                      Routes.companyProjectDetailsViewRoute,
                      arguments: {
                        'projectModel': projects[index],
                        'companyModel': companyModel,
                      });
                  if (result == true && context.mounted) {
                    context.read<ProjectCubit>().getUpcomingProjects();
                  }
                },
              );
            },
          );
  }
}
