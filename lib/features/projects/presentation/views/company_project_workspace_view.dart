import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../data/models/project_model.dart';
import '../../data/models/rating_request_model.dart';
import '../logic/project_cubit/project_cubit.dart';
import '../widgets/company_review_status_widget.dart';
import '../widgets/company_work_status_widget.dart';
import '../widgets/project_workspace_app_bar.dart';
import '../widgets/project_workspace_status_section.dart';
import '../widgets/rating_bar_section.dart';

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
                      Container(
                        height: 140,
                        decoration: const BoxDecoration(
                          color: AppColors.cardColor,
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                      ),
                      verticalSpace(25),
                      ProjectWorkspaceStatusSection(
                          status: widget.projectModel.status.value - 2),
                      getWorkspaceWidget(widget.projectModel.status.value - 2),
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

  Widget getWorkspaceWidget(int status) {
    switch (status) {
      case 0:
        return const CompanyWorkStatusWidget();
      case 1:
        return CompanyReviewStatusWidget(projectModel: widget.projectModel);
      case 2:
        return RatingBarSection(
          isFreelancer: false,
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
