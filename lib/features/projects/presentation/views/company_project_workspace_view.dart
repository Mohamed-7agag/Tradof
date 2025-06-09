import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../data/models/project_model.dart';
import '../../data/models/rating_request_model.dart';
import '../logic/project_cubit/project_cubit.dart';
import '../widgets/company_review_status_widget.dart';
import '../widgets/company_work_status_widget.dart';
import '../widgets/project_workspace_app_bar.dart';
import '../widgets/project_workspace_status_section.dart';
import '../widgets/rating_bar_section.dart';
import 'started_and_current_project_details_view.dart';

class CompanyProjectWorkspaceView extends StatefulWidget {
  const CompanyProjectWorkspaceView({required this.projectModel, super.key});

  final ProjectModel projectModel;

  @override
  State<CompanyProjectWorkspaceView> createState() =>
      _CompanyProjectWorkspaceViewState();
}

class _CompanyProjectWorkspaceViewState
    extends State<CompanyProjectWorkspaceView> {
  @override
  void initState() {
    super.initState();
    context.read<ProjectCubit>().getPaymentStatus(widget.projectModel.id);
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
          BlocBuilder<ProjectCubit, ProjectState>(
            buildWhen: (previous, current) =>
                current.status == ProjectStatus.currentProjectsSuccess,
            builder: (context, state) {
              return Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    children: [
                      verticalSpace(16),
                      FreelancerProfileData(
                        projectModel: widget.projectModel,
                      ),
                      verticalSpace(25),
                      ProjectWorkspaceStatusSection(
                        status: _getStatus(),
                      ),
                      getWorkspaceWidget(),
                    ],
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }

  int _getStatus() {
    switch (widget.projectModel.status.value) {
      case 1:
      case 2:
        return 0; // Work in progress
      case 3:
        return 1; // Review
      case 4:
        return 2; // Completed
      default:
        return -1; // Unknown status
    }
  }

  Widget getWorkspaceWidget() {
    switch (widget.projectModel.status.value) {
      case 1:
      case 2:
        return const CompanyWorkStatusWidget();
      case 3:
        return CompanyReviewStatusWidget(projectModel: widget.projectModel);
      case 4:
        return RatingBarSection(
          isFreelancer: false,
          ignoreGestures: widget.projectModel.status.value == 4,
          onRatingUpdate: (rating) {
            context.read<ProjectCubit>().giveRating(
                  RatingRequestModel(
                    projectId: widget.projectModel.id,
                    ratingValue: rating,
                    review: '',
                    ratedToId: widget.projectModel.freelancerId,
                    ratedById: widget.projectModel.companyId,
                  ),
                );
          },
        );
      default:
        return const SizedBox.shrink();
    }
  }
}
