import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../widgets/freelancer_review_status_widget.dart';
import '../widgets/freelancer_work_status_widget.dart';
import '../widgets/project_workspace_app_bar.dart';
import '../widgets/project_workspace_status_section.dart';
import '../widgets/rating_bar_section.dart';

class FreelancerProjectWorkspaceView extends StatelessWidget {
  const FreelancerProjectWorkspaceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const ProjectWorkspaceAppBar(),
          Expanded(
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
                  const ProjectWorkspaceStatusSection(status: 0),
                  getWorkspaceWidget(0),
                ],
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
        return const FreelancerWorkStatusWidget();
      case 1:
        return const FreelancerReviewStatusWidget();
      case 2:
        return RatingBarSection(
          onRatingUpdate: (rating) {
            // set rating in project cubit to send to api
          },
        );
      default:
        return const SizedBox.shrink();
    }
  }
}
