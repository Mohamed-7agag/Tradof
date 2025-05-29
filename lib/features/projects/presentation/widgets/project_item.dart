import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_style.dart';
import '../../data/models/project_model.dart';

class ProjectItem extends StatelessWidget {
  const ProjectItem({
    required this.project,
    required this.onTap,
    super.key,
  });

  final ProjectModel project;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      onTap: onTap,
      child: SlideInLeft(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          margin: const EdgeInsets.only(bottom: 12),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
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
                  backgroundImage: project.profileImageUrl.isNullOrEmpty()
                      ? null
                      : CachedNetworkImageProvider(
                          project.profileImageUrl!,
                        ),
                  child: project.profileImageUrl.isNullOrEmpty()
                      ? const HugeIcon(
                          icon: HugeIcons.strokeRoundedUser,
                          color: AppColors.primary,
                        )
                      : null,
                ),
                title: Text(
                  '${project.firstName} ${project.lastName}',
                  style: AppStyle.robotoRegular14,
                ),
                subtitle:
                    Text(project.jobTitle, style: AppStyle.robotoRegular12),
                trailing: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.green.withValues(alpha: 0.15),
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                  ),
                  child: Text(
                    project.status.name,
                    style: AppStyle.robotoRegular8.copyWith(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Text(
                project.specialization.name,
                style: AppStyle.robotoRegular12.copyWith(
                  color: AppColors.black,
                ),
              ),
              verticalSpace(8),
              Text(
                project.name,
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
                  _buildInfoColumn(
                      'Price', '${project.minPrice} - ${project.maxPrice} EGP'),
                  const SizedBox(
                    height: 35,
                    child: VerticalDivider(color: AppColors.cardDarkColor),
                  ),
                  _buildInfoColumn('Deadline', '${project.days} Days'),
                  const SizedBox(
                    height: 35,
                    child: VerticalDivider(color: AppColors.cardDarkColor),
                  ),
                  _buildInfoColumn('Offers', '${project.numberOfOffers}'),
                ],
              ),
              verticalSpace(16),
            ],
          ),
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
