import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_style.dart';
import '../../../company_profile/data/model/company_model.dart';

class CompanySettingProfileInfo extends StatelessWidget {
  const CompanySettingProfileInfo({
    required this.companyModel,
    super.key,
  });
  final CompanyModel companyModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: ListTile(
        horizontalTitleGap: 12,
        contentPadding: EdgeInsets.symmetric(
          vertical: 5.h,
          horizontal: 14.w,
        ),
        leading: CircleAvatar(
          radius: 26,
          backgroundColor: AppColors.white,
          backgroundImage:
              CachedNetworkImageProvider(companyModel.profileImageUrl),
        ),
        title: Text(
          '${companyModel.firstName} ${companyModel.lastName}',
          style: AppStyle.robotoCondensedRegular15,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              companyModel.email,
              style: AppStyle.robotoCondensedRegular12,
            ),
            Text(
              'Company',
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
