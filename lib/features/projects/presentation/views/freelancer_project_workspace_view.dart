import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../data/models/project_model.dart';
import '../../data/models/rating_request_model.dart';
import '../logic/project_cubit/project_cubit.dart';
import '../widgets/freelancer_review_status_widget.dart';
import '../widgets/freelancer_work_status_widget.dart';
import '../widgets/project_workspace_app_bar.dart';
import '../widgets/project_workspace_status_section.dart';
import '../widgets/rating_bar_section.dart';
import 'started_and_current_project_details_view.dart';

class FreelancerProjectWorkspaceView extends StatefulWidget {
  const FreelancerProjectWorkspaceView({required this.projectModel, super.key});

  final ProjectModel projectModel;

  @override
  State<FreelancerProjectWorkspaceView> createState() =>
      _FreelancerProjectWorkspaceViewState();
}

class _FreelancerProjectWorkspaceViewState
    extends State<FreelancerProjectWorkspaceView> {
  @override
  void initState() {
    context.read<ProjectCubit>().getProjectByID(widget.projectModel.id);
    super.initState();
  }

  int getStatus(String status) {
    switch (status) {
      case 'Active':
        return 0;
      case 'OnReviewing':
        return 1;
      case 'Finished':
        return 2;

      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ProjectWorkspaceAppBar(projectModel: widget.projectModel),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: BlocBuilder<ProjectCubit, ProjectState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      verticalSpace(16),
                      CompanyProfileData(projectModel: widget.projectModel),
                      verticalSpace(25),
                      /**
        Pending ==> 0
        Active, ==> 1
        InProgress, ==> 2
        OnReviewing, ==> 3
        Finished, ==> 4
        Cancelled, ==> 5
 */
                      ProjectWorkspaceStatusSection(
                          status: getStatus(widget.projectModel.status.name)),
                      getWorkspaceWidget(
                          getStatus(widget.projectModel.status.name)),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getWorkspaceWidget(int status) {
    switch (status) {
      case 0:
        return FreelancerWorkStatusWidget(projectModel: widget.projectModel);
      case 1:
        return const FreelancerReviewStatusWidget();
      case 2:
        return BlocBuilder<ProjectCubit, ProjectState>(
          buildWhen: (previous, current) =>
              current.status == ProjectStatus.getProjectByIDSuccess,
          builder: (context, state) {
            return RatingBarSection(
              initialRating:
                  state.project?.ratingFromFreelancer?.ratingValue.toDouble() ??
                      3,
              onRatingUpdate: (rating) {
                context.read<ProjectCubit>().giveRating(
                      RatingRequestModel(
                        projectId: widget.projectModel.id,
                        ratingValue: rating.toDouble(),
                        review: '',
                        ratedToId: widget.projectModel.companyId,
                        ratedById: widget.projectModel.freelancerId,
                      ),
                    );
              },
            );
          },
        );
      default:
        return const SizedBox.shrink();
    }
  }
}
