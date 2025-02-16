import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradof/core/utils/widgets/custom_failure_widget.dart';
import 'package:tradof/core/utils/widgets/custom_loading_widget.dart';
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
        if (state.status.isGetUpcomingProjectsSuccess) {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.only(top: 40,bottom: 100),
            itemCount: state.upcomingProjects.length,
            itemBuilder: (BuildContext context, int index) {
              return UpcomingProjectItem(
                  project: state.upcomingProjects[index],
                  companyModel: companyModel);
            },
          );
        } else if (state.status.isGetUpcomingProjectsFailure) {
          return CustomFailureWidget(text: state.errorMessage);
        }
        return CustomLoadingWidget();
      },
    );
  }
}
