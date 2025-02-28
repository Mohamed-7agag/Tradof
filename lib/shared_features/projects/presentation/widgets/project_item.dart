import 'package:cached_network_image/cached_network_image.dart';
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
              leading: CircleAvatar(
                radius: 22,
                backgroundColor: AppColors.cardDarkColor,
                backgroundImage: CachedNetworkImageProvider(
                  projectModel.profileImageUrl ?? '',
                ),
              ),
              title: Text(
                '${projectModel.firstName} ${projectModel.lastName}',
                style: AppStyle.robotoRegular14,
              ),
              subtitle:
                  Text(projectModel.jobTitle, style: AppStyle.robotoRegular12),
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
              projectModel.specialization.name,
              style: AppStyle.robotoRegular12.copyWith(
                color: AppColors.black,
              ),
            ),
            verticalSpace(8),
            Text(
              projectModel.name,
              style: AppStyle.robotoCondensedMedium15.copyWith(
                fontWeight: FontWeight.w600,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            verticalSpace(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildInfoColumn('Price',
                    '${projectModel.minPrice} - ${projectModel.maxPrice}\$'),
                const SizedBox(
                  height: 35,
                  child: VerticalDivider(color: AppColors.cardDarkColor),
                ),
                _buildInfoColumn('Deadline', '${projectModel.days} Days'),
                const SizedBox(
                  height: 35,
                  child: VerticalDivider(color: AppColors.cardDarkColor),
                ),
                _buildInfoColumn('Offers', '${projectModel.numberOfOffers}'),
              ],
            ),
            verticalSpace(16),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoColumn(String title, String value) {
    return Column(
      children: [
        Text(
          title,
          style: AppStyle.robotoCondensedRegular12,
        ),
        verticalSpace(6),
        Text(
          value,
          style: AppStyle.robotoRegular12.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
