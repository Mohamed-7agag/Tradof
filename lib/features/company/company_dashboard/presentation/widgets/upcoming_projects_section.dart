import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tradof/core/utils/widgets/custom_failure_widget.dart';
import 'package:tradof/core/utils/widgets/custom_loading_widget.dart';
import 'package:tradof/core/utils/widgets/custom_refresh_indicator.dart';
import 'package:tradof/features/projects/data/models/project_model.dart';
import 'package:tradof/features/projects/presentation/widgets/upcoming_project_item.dart';

import '../../../../projects/presentation/logic/project_cubit/project_cubit.dart';
import '../../../company_profile/data/model/company_model.dart';

class UpcomingProjectsSection extends StatelessWidget {
  const UpcomingProjectsSection({super.key, required this.companyModel});
  final CompanyModel companyModel;
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
                  companyModel: companyModel,
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
    super.key,
    required this.companyModel,
    required this.projects,
  });

  final CompanyModel companyModel;
  final List<ProjectModel> projects;

  @override
  Widget build(BuildContext context) {
    return projects.isEmpty
        ? const CustomFailureWidget(text: 'No Projects Found')
        : ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.only(top: 40, bottom: 100),
            itemCount: projects.length,
            itemBuilder: (BuildContext context, int index) {
              return UpcomingProjectItem(
                project: projects[index],
                companyModel: companyModel,
              );
            },
          );
  }
}
