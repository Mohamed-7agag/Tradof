import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../core/helpers/extensions.dart';
import '../../../core/theming/app_colors.dart';
import '../../../core/theming/app_style.dart';

class SettingProfileInfo extends StatelessWidget {
  const SettingProfileInfo({
    required this.userName,
    required this.email,
    required this.role,
    super.key,
    this.profileImageUrl,
  });
  final String userName;
  final String email;
  final String? profileImageUrl;
  final String role;

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
          backgroundColor: AppColors.cardDarkColor,
          backgroundImage: profileImageUrl.isNullOrEmpty()
              ? null
              : CachedNetworkImageProvider(
                  profileImageUrl!,
                ),
          child: profileImageUrl.isNullOrEmpty()
              ? const HugeIcon(
                  icon: HugeIcons.strokeRoundedUser,
                  color: AppColors.primary,
                )
              : null,
        ),
        title: Text(
          userName,
          style: AppStyle.robotoCondensedRegular15,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              email,
              style: AppStyle.robotoCondensedRegular12,
            ),
            Text(
              role,
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
