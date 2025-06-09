import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_style.dart';
import '../../data/models/project_model.dart';

class ProjectWorkspaceAppBar extends StatelessWidget {
  const ProjectWorkspaceAppBar({required this.projectModel, super.key});
  final ProjectModel projectModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: AppColors.primary),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(16),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: AppColors.white,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    context.pushNamed(Routes.chatViewRoute, arguments: projectModel);
                  },
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.white24,
                    padding: const EdgeInsets.all(10),
                  ),
                  icon: const HugeIcon(
                    icon: HugeIcons.strokeRoundedChatting01,
                    color: AppColors.white,
                  ),
                ),
                horizontalSpace(16),
              ],
            ),
            verticalSpace(6),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Workspace',
                    style:
                        AppStyle.robotoBold20.copyWith(color: AppColors.white),
                  ),
                  Text(
                    'Translation of an article about medical tools...',
                    style: AppStyle.robotoCondensedRegular15
                        .copyWith(color: AppColors.white),
                  ),
                ],
              ),
            ),
            verticalSpace(14),
          ],
        ),
      ),
    );
  }
}
