import 'package:flutter/material.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_style.dart';
import '../../../../core/utils/widgets/custom_button.dart';

class ProjectWorkSpaceReviewSection extends StatelessWidget {
  const ProjectWorkSpaceReviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Uploaded Files', style: AppStyle.poppinsMedium14),
          verticalSpace(12),
          Container(
            height: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.grey)),
          ),
          const Spacer(),
          CustomButton(
            text: 'Finish',
            color: AppColors.lightOrange,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
