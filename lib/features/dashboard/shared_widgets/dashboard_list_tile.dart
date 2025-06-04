import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../../core/helpers/extensions.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_style.dart';
import '../../../core/routing/routes.dart';

class DashboardListTile extends StatelessWidget {
  const DashboardListTile({
    required this.userName,
    required this.email,
    this.profileImageUrl,
    super.key,
  });
  final String userName;
  final String email;
  final String? profileImageUrl;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
      horizontalTitleGap: 10,
      leading: CircleAvatar(
        radius: 24,
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
        style: AppStyle.poppinsMedium14.copyWith(
          color: AppColors.white,
        ),
      ),
      subtitle: Text(
        email,
        style: AppStyle.robotoRegular10.copyWith(
          color: AppColors.white,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () => context.pushNamed(Routes.notificationViewRoute),
            child: const HugeIcon(
              icon: HugeIcons.strokeRoundedNotification03,
              color: AppColors.white,
            ),
          ),
          horizontalSpace(18),
          InkWell(
            onTap: () => context.pushNamed(Routes.calendarViewRoute),
            child: const HugeIcon(
              icon: HugeIcons.strokeRoundedCalendar02,
              color: AppColors.white,
            ),
          ),
          horizontalSpace(4),
        ],
      ),
    );
  }
}
