import 'package:flutter/material.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_style.dart';
import '../../data/models/project_model.dart';

class ProjectItem extends StatelessWidget {
  const ProjectItem({required this.projectModel, super.key});
  final ProjectModel projectModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(
          Routes.freelancerProjectDetailsViewRoute,
          arguments: projectModel,
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(18)),
          color: AppColors.cardColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              horizontalTitleGap: 10,
              leading: const CircleAvatar(
                radius: 22,
                backgroundColor: AppColors.primary,
              ),
              title: Text('Yousef Ghareb', style: AppStyle.robotoRegular14),
              subtitle: Text('Job Title', style: AppStyle.robotoRegular12),
              trailing: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.green.withValues(alpha: 0.15),
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                ),
                child: Text(
                  projectModel.status.name,
                  style: AppStyle.robotoRegular8.copyWith(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Text(
              projectModel.name,
              style: AppStyle.robotoCondensedMedium15,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            verticalSpace(14),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text('Start At', style: AppStyle.robotoCondensedBold14),
                    verticalSpace(4),
                    Text('11/11/2023', style: AppStyle.robotoCondensedMedium12),
                  ],
                ),
                Column(
                  children: [
                    Text('Deadline', style: AppStyle.robotoCondensedBold14),
                    verticalSpace(4),
                    Text(
                      '${projectModel.days} Days',
                      style: AppStyle.robotoCondensedMedium12,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text('Price', style: AppStyle.robotoCondensedBold14),
                    verticalSpace(4),
                    Text(
                      '${projectModel.minPrice} - ${projectModel.maxPrice}\$',
                      style: AppStyle.robotoCondensedMedium12,
                    ),
                  ],
                ),
              ],
            ),
            verticalSpace(14),
          ],
        ),
      ),
    );
  }
}
