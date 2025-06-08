import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../data/models/project_model.dart';
import '../../data/models/rating_request_model.dart';
import '../logic/project_cubit/project_cubit.dart';
import '../widgets/freelancer_review_status_widget.dart';
import '../widgets/freelancer_work_status_widget.dart';
import '../widgets/project_workspace_app_bar.dart';
import '../widgets/project_workspace_status_section.dart';
import '../widgets/rating_bar_section.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const ProjectWorkspaceAppBar(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: BlocBuilder<ProjectCubit, ProjectState>(
                //  buildWhen: (previous, current) => current.status.isSetProjectStatus,
                builder: (context, state) {
                  return Column(
                    children: [
                      verticalSpace(16),
                      Container(
                        height: 140,
                        decoration: const BoxDecoration(
                          color: AppColors.cardColor,
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                      ),
                      verticalSpace(25),
                      /**
        Active, ==> 1
        InProgress, ==> 2
        OnReviewing, ==> 3
        Finished, ==> 4
        Cancelled, ==> 5
 */
                      const ProjectWorkspaceStatusSection(status: 0),
                      getWorkspaceWidget(0),
                    ],
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget getWorkspaceWidget(int status) {
    switch (status) {
      case 0:
        return FreelancerWorkStatusWidget(projectId: widget.projectModel.id);
      case 1:
        return const FreelancerReviewStatusWidget();
      case 2:
        return RatingBarSection(
          onRatingUpdate: (rating) {
            context.read<ProjectCubit>().giveRating(
                  RatingRequestModel(
                    projectId: widget.projectModel.id,
                    ratingValue: rating,
                    review: '',
                    ratedToId: widget.projectModel.companyId,
                    ratedById: widget.projectModel.freelancerId,
                  ),
                );
          },
        );
      default:
        return const SizedBox.shrink();
    }
  }
}
