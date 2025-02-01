import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tradof/core/theming/app_colors.dart';
import 'package:tradof/core/theming/app_style.dart';
import 'package:tradof/features/company/profile_company/data/model/company_model.dart';

class UserImageAndInfo extends StatelessWidget {
  const UserImageAndInfo({super.key, required this.companyModel});

  final CompanyModel companyModel;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        radius: 26.r,
        backgroundColor: AppColors.white,
        backgroundImage: CachedNetworkImageProvider(
          companyModel.profileImageUrl,
        ),
      ),
      title: Text(
        '${companyModel.firstName} ${companyModel.lastName}',
        style: AppStyle.robotoSemiBold12
            .copyWith(color: AppColors.white, fontSize: 15.sp),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            companyModel.email,
            style: AppStyle.robotoRegular12.copyWith(color: AppColors.white),
          ),
          Text(
            companyModel.jobTitle,
            style: AppStyle.robotoRegular12.copyWith(color: AppColors.white),
          ),
        ],
      ),
      trailing: SvgPicture.asset('assets/images/edit.svg', width: 26),
    );
  }
}
