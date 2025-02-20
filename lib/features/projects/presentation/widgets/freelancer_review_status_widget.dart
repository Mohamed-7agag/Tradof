import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_style.dart';

class FreelancerReviewStatusWidget extends StatelessWidget {
  const FreelancerReviewStatusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 0.8.sw,
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.cardColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'The project is currently being Reviewed by the company',
                  style: AppStyle.poppinsMedium15.copyWith(
                    color: AppColors.primary,
                    fontStyle: FontStyle.italic,
                    fontSize: 16.sp
                  ),
                  textAlign: TextAlign.center,
                ),
                verticalSpace(14),
                const HugeIcon(
                  icon: HugeIcons.strokeRoundedTimer02,
                  color: AppColors.primary,
                  size: 50,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
