import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_style.dart';
import '../../../freelancer_profile/data/model/freelancer_model.dart';

class FreelancerSettingProfileInfo extends StatelessWidget {
  const FreelancerSettingProfileInfo({
    required this.freelancerModel,
    super.key,
  });
  final FreelancerModel freelancerModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(
          vertical: 5.h,
          horizontal: 14.w,
        ),
        leading: CircleAvatar(
          radius: 26,
          backgroundColor: AppColors.white,
          backgroundImage:
              CachedNetworkImageProvider(freelancerModel.profileImageUrl),
        ),
        title: Text(
          '${freelancerModel.firstName} ${freelancerModel.lastName}',
          style: AppStyle.robotoCondensedRegular15,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              freelancerModel.email,
              style: AppStyle.robotoCondensedRegular12,
            ),
            Text(
              'Freelancer',
              style: AppStyle.robotoRegular10,
            ),
          ],
        ),
        trailing: const Padding(
          padding: EdgeInsets.only(right: 8),
          child: CircleAvatar(
            radius: 4,
            backgroundColor: Colors.green,
          ),
        ),
      ),
    );
  }
}
