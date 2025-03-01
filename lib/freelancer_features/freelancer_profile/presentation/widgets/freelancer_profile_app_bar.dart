import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_style.dart';
import '../../../../core/utils/app_constants.dart';
import '../../data/model/freelancer_model.dart';
import 'freelancer_image_and_info.dart';

class FreelancerProfileAppBar extends StatelessWidget {
  const FreelancerProfileAppBar({required this.freelancerModel, super.key});
  final FreelancerModel freelancerModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: const BoxDecoration(color: AppColors.primary),
      child: SafeArea(
        child: Column(
          children: [
            verticalSpace(16),
            SlideInDown(
              from: 400,
              child: Row(
                children: [
                  if (freelancerModel.userId != AppConstants.kUserId) ...[
                    GestureDetector(
                      onTap: () => context.pop(),
                      child: const Icon(
                        Icons.arrow_back,
                        color: AppColors.white,
                      ),
                    ),
                    horizontalSpace(12)
                  ],
                  Text(
                    'Profile',
                    style:
                        AppStyle.robotoBold20.copyWith(color: AppColors.white),
                  ),
                  const Spacer(),
                  SvgPicture.asset('assets/images/user.svg')
                ],
              ),
            ),
            verticalSpace(10),
            FreelancerImageAndInfo(freelancerModel: freelancerModel),
            verticalSpace(12),
          ],
        ),
      ),
    );
  }
}
