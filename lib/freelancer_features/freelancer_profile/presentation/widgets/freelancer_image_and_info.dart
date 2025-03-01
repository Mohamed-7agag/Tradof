import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_style.dart';
import '../../data/model/freelancer_model.dart';

class FreelancerImageAndInfo extends StatelessWidget {
  const FreelancerImageAndInfo({required this.freelancerModel, super.key});
  final FreelancerModel freelancerModel;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: SlideInLeft(
        from: 400,
        child: CircleAvatar(
          radius: 26,
          backgroundColor: AppColors.cardDarkColor,
          backgroundImage: freelancerModel.profileImageUrl.isNullOrEmpty()
              ? null
              : CachedNetworkImageProvider(
                  freelancerModel.profileImageUrl!,
                ),
          child: freelancerModel.profileImageUrl.isNullOrEmpty()
              ? const HugeIcon(
                  icon: HugeIcons.strokeRoundedUser,
                  color: AppColors.primary,
                )
              : null,
        ),
      ),
      title: Text(
        '${freelancerModel.firstName} ${freelancerModel.lastName}',
        style: AppStyle.robotoSemiBold12
            .copyWith(color: AppColors.white, fontSize: 15.sp),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            freelancerModel.email,
            style: AppStyle.robotoRegular12.copyWith(color: AppColors.white),
          ),
          Text(
            freelancerModel.countryName,
            style: AppStyle.robotoRegular12.copyWith(color: AppColors.white),
          ),
        ],
      ),
    );
  }
}
