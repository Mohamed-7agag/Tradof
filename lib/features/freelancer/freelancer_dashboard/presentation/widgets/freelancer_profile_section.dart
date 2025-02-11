import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_style.dart';
import '../../../freelancer_profile/data/model/freelancer_model.dart';

class FreelancerProfileSection extends StatelessWidget {
  const FreelancerProfileSection({super.key, required this.freelancerModel});
  final FreelancerModel freelancerModel;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
      horizontalTitleGap: 10,
      leading: CircleAvatar(
        radius: 24,
        backgroundColor: AppColors.white,
        backgroundImage: CachedNetworkImageProvider(freelancerModel.profileImageUrl),
      ),
      title: Text(
        '${freelancerModel.firstName} ${freelancerModel.lastName}',
        style: AppStyle.poppinsMedium14.copyWith(color: AppColors.white),
      ),
      subtitle: Text(
        freelancerModel.email,
        style: AppStyle.robotoRegular10.copyWith(color: AppColors.white),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/bell2.png', width: 22),
          horizontalSpace(18),
          Image.asset('assets/images/calendar.png', width: 22),
          horizontalSpace(4),
        ],
      ),
    );
  }
}
