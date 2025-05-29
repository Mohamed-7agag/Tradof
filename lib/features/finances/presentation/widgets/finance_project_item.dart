import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_style.dart';
import '../../data/model/finance_project_model.dart';

class FinanceProjectItem extends StatelessWidget {
  const FinanceProjectItem({required this.project, super.key});
  final FinanceProjectModel project;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            horizontalTitleGap: 10,
            title: Text(
              '${project.user.firstName} ${project.user.lastName}',
              style: AppStyle.poppinsMedium15,
            ),
            leading: CircleAvatar(
              radius: 22,
              backgroundColor: AppColors.cardDarkColor,
              backgroundImage: CachedNetworkImageProvider(
                project.user.profileImageUrl.isNullOrEmpty()
                    ? ''
                    : project.user.profileImageUrl!,
              ),
              child: project.user.profileImageUrl.isNullOrEmpty()
                  ? const HugeIcon(
                      icon: HugeIcons.strokeRoundedUser,
                      color: AppColors.primary,
                    )
                  : null,
            ),
          ),
          verticalSpace(8),
          Text(
            project.prjectData.name,
            style: AppStyle.robotoRegular14,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          verticalSpace(12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${project.prjectData.deliveryTime} Days',
                style: AppStyle.robotoRegular12,
              ),
              Text(
                '${project.prjectData.depoistPrice} EGP',
                style: AppStyle.poppinsMedium15.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          verticalSpace(12)
        ],
      ),
    );
  }
}
