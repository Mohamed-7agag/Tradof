import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_style.dart';
import '../../../../core/utils/app_constants.dart';
import '../../data/model/company_model.dart';

class UserImageAndInfo extends StatelessWidget {
  const UserImageAndInfo({required this.companyModel, super.key});

  final CompanyModel companyModel;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: SlideInLeft(
        from: 400,
        child: CircleAvatar(
          radius: 26,
          backgroundColor: AppColors.cardDarkColor,
          backgroundImage: companyModel.profileImageUrl.isNullOrEmpty()
              ? null
              : CachedNetworkImageProvider(
                  companyModel.profileImageUrl!,
                ),
          child: companyModel.profileImageUrl.isNullOrEmpty()
              ? const HugeIcon(
                  icon: HugeIcons.strokeRoundedUser,
                  color: AppColors.primary,
                )
              : null,
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
            companyModel.companyName,
            style: AppStyle.robotoRegular12.copyWith(color: AppColors.white),
          ),
        ],
      ),
      trailing: companyModel.id == AppConstants.kUserId
          ? IconButton(
              onPressed: () {
                context.pushNamed(Routes.companyEmployeesViewRoute);
              },
              icon: const HugeIcon(
                icon: HugeIcons.strokeRoundedUserGroup,
                color: Colors.white,
                size: 28,
              ),
            )
          : null,
    );
  }
}
