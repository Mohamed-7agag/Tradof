import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_style.dart';

class ProjectItem extends StatelessWidget {
  const ProjectItem({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: AppColors.cardColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            horizontalTitleGap: 10,
            leading: const CircleAvatar(
                radius: 22, backgroundColor: AppColors.primary),
            title: Text('Yousef Ghareb', style: AppStyle.robotoRegular14),
            subtitle: Text('Job Title', style: AppStyle.robotoRegular12),
            trailing: Text(
              'Active',
              style: AppStyle.robotoRegular10
                  .copyWith(color: Colors.green, fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            'Translation of an article about medical tools,nson of an article about medical tools',
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
                  Text('24 Days', style: AppStyle.robotoCondensedMedium12),
                ],
              ),
              Column(
                children: [
                  Text('Price', style: AppStyle.robotoCondensedBold14),
                  verticalSpace(4),
                  Text('100\$', style: AppStyle.robotoCondensedMedium12),
                ],
              ),
            ],
          ),
          verticalSpace(12),
        ],
      ),
    );
  }
}
