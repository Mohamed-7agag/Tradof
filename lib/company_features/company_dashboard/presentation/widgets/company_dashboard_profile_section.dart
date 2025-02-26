import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_style.dart';
import '../../../company_profile/data/model/company_model.dart';

class CompanyDashboardProfileSection extends StatelessWidget {
  const CompanyDashboardProfileSection({required this.companyModel, super.key});
  final CompanyModel companyModel;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
      horizontalTitleGap: 10,
      leading: CircleAvatar(
        radius: 24,
        backgroundColor: AppColors.white,
        backgroundImage: CachedNetworkImageProvider(
          companyModel.profileImageUrl,
        ),
      ),
      title: Text(
        '${companyModel.firstName} ${companyModel.lastName}',
        style: AppStyle.poppinsMedium14.copyWith(
          color: AppColors.white,
        ),
      ),
      subtitle: Text(
        companyModel.email,
        style: AppStyle.robotoRegular10.copyWith(
          color: AppColors.white,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const HugeIcon(
            icon: HugeIcons.strokeRoundedNotification03,
            color: AppColors.white,
          ),
          horizontalSpace(18),
          const HugeIcon(
            icon: HugeIcons.strokeRoundedCalendar02,
            color: AppColors.white,
          ),
          horizontalSpace(4),
        ],
      ),
    );
  }
}
