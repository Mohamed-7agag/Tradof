import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_style.dart';
import '../../../../core/utils/widgets/custom_app_bar.dart';
import '../../../../core/utils/widgets/custom_button.dart';
import '../../data/models/project_model.dart';
import '../widgets/download_attachment_files_section.dart';
import '../widgets/freelancer_project_details_body.dart';

class FreelancerProjectDetailsView extends StatelessWidget {
  const FreelancerProjectDetailsView({required this.projectModel, super.key});
  final ProjectModel projectModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(title: 'Project Details'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace(20),
                  SlideInRight(
                    from: 400,
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(14)),
                        color: AppColors.cardColor,
                      ),
                      child: ListTile(
                        horizontalTitleGap: 10,
                        leading: const CircleAvatar(
                          radius: 22,
                          backgroundColor: AppColors.primary,
                        ),
                        title: Text(
                          'Yousef Ghareb',
                          style: AppStyle.robotoRegular14,
                        ),
                        subtitle:
                            Text('Job Title', style: AppStyle.robotoRegular12),
                        trailing: const HugeIcon(
                          icon: HugeIcons.strokeRoundedSquareArrowUpRight,
                          color: AppColors.primary,
                          size: 26,
                        ),
                      ),
                    ),
                  ),
                  verticalSpace(20),
                  SlideInRight(
                    from: 400,
                    delay: const Duration(milliseconds: 100),
                    child: FreelancerProjectDetailsBody(
                      projectModel: projectModel,
                    ),
                  ),
                  verticalSpace(20),
                  SlideInRight(
                    from: 400,
                    delay: const Duration(milliseconds: 200),
                    child: DownloadAttachmentFilesSection(
                      files: projectModel.files,
                    ),
                  ),
                  Expanded(child: verticalSpace(30)),
                  SlideInUp(
                    from: 400,
                    delay: const Duration(milliseconds: 300),
                    child: CustomButton(
                        text: 'Add Offer',
                        onPressed: () {
                          context.pushNamed(
                            Routes.addOfferViewRoute,
                            arguments: projectModel.id,
                          );
                        }),
                  ),
                  verticalSpace(20),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
