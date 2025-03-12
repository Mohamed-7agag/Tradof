import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../../core/helpers/extensions.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_style.dart';
import '../../../core/routing/routes.dart';

class ProfileAppBarListTile extends StatelessWidget {
  const ProfileAppBarListTile({
    required this.userName,
    required this.email,
    required this.extra,
    required this.isMyCompany,
    this.userImageUrl,
    super.key,
  });
  final String? userImageUrl;
  final String userName;
  final String email;
  final String extra;
  final bool isMyCompany;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: SlideInLeft(
        from: 400,
        child: CircleAvatar(
          radius: 26,
          backgroundColor: AppColors.cardDarkColor,
          backgroundImage: userImageUrl.isNullOrEmpty()
              ? null
              : CachedNetworkImageProvider(userImageUrl!),
          child: userImageUrl.isNullOrEmpty()
              ? const HugeIcon(
                  icon: HugeIcons.strokeRoundedUser,
                  color: AppColors.primary,
                )
              : null,
        ),
      ),
      title: Text(
        userName,
        style: AppStyle.robotoSemiBold12
            .copyWith(color: AppColors.white, fontSize: 15.sp),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            email,
            style: AppStyle.robotoRegular12.copyWith(
              color: AppColors.white,
            ),
          ),
          Text(
            extra,
            style: AppStyle.robotoRegular12.copyWith(
              color: AppColors.white,
            ),
          ),
        ],
      ),
      trailing: isMyCompany
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
