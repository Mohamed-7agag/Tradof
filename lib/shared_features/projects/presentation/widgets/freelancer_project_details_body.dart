import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_style.dart';
import '../../data/models/project_model.dart';

class FreelancerProjectDetailsBody extends StatelessWidget {
  const FreelancerProjectDetailsBody({required this.projectModel, super.key});
  final ProjectModel projectModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 14,
      ),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(14)),
        color: AppColors.cardColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProjectDetailsBodyItem(
            title: 'Project Name',
            value: projectModel.name,
          ),
          verticalSpace(18),
          ProjectDetailsBodyItem(
            title: 'Project Description',
            value: projectModel.description,
          ),
          const Divider(color: AppColors.cardDarkColor, height: 40),
          ProjectDetailsBodyItem(
            title: 'Specialization',
            value: projectModel.specialization.name,
          ),
          verticalSpace(18),
          ProjectDetailsBodyItem(
            title: 'Language Pair',
            value:
                '${projectModel.languageFrom.languageName} (${projectModel.languageFrom.countryCode}) - ${projectModel.languageTo.languageName} (${projectModel.languageTo.countryCode})',
          ),
          const Divider(color: AppColors.cardDarkColor, height: 40),
          Row(
            children: [
              ProjectDetailsBodyItem(
                title: 'Price',
                value: '${projectModel.minPrice} - ${projectModel.maxPrice}\$',
              ),
              
              const Spacer(flex: 2),
              ProjectDetailsBodyItem(
                title: 'DeadLine',
                value: '${projectModel.days} Days',
              ),
              const Spacer(flex: 2),
              ProjectDetailsBodyItem(
                title: 'IEFT tag',
                value:
                    '${projectModel.languageFrom.languageCode} - ${projectModel.languageTo.languageCode}',
              ),
              const Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}

class ProjectDetailsBodyItem extends StatelessWidget {
  const ProjectDetailsBodyItem({
    required this.title,
    required this.value,
    super.key,
  });
  final String title, value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppStyle.robotoRegular10),
        verticalSpace(5),
        Text(value, style: AppStyle.robotoCondensedRegular15),
      ],
    );
  }
}
