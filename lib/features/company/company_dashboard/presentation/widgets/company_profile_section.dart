import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tradof/features/company/company_profile/data/model/company_model.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_style.dart';

class CompanyProfileSection extends StatelessWidget {
  const CompanyProfileSection({super.key, required this.companyModel});
  final CompanyModel companyModel;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
      horizontalTitleGap: 10,
      leading: CircleAvatar(
        radius: 24,
        backgroundColor: AppColors.white,
        backgroundImage:
            CachedNetworkImageProvider(companyModel.profileImageUrl),
      ),
      title: Text(
        '${companyModel.firstName} ${companyModel.lastName}',
        style: AppStyle.poppinsMedium14.copyWith(color: AppColors.white),
      ),
      subtitle: Text(
        companyModel.jobTitle,
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
