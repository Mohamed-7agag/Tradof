import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../core/theming/app_colors.dart';
import 'setting_item.dart';

class SettingsSection1 extends StatelessWidget {
  const SettingsSection1({
    required this.onPersonalInfoTap,
    required this.onNotificationTap,
    required this.onCalenderTap,
    super.key,
  });
  final VoidCallback onPersonalInfoTap;
  final VoidCallback onNotificationTap;
  final VoidCallback onCalenderTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 14.w),
      decoration: const BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Column(
        children: [
          SettingItem(
            title: 'Personal info',
            icon: const HugeIcon(
              icon: HugeIcons.strokeRoundedUserAccount,
              color: Colors.green,
              size: 26,
            ),
            onTap: onPersonalInfoTap,
          ),
          const Divider(color: AppColors.cardDarkColor),
          SettingItem(
            title: 'Notification',
            icon: const HugeIcon(
              icon: HugeIcons.strokeRoundedNotification03,
              color: AppColors.primary,
            ),
            onTap: onNotificationTap,
          ),
          const Divider(color: AppColors.cardDarkColor),
          SettingItem(
            title: 'Clander',
            icon: const HugeIcon(
              icon: HugeIcons.strokeRoundedCalendar02,
              color: Colors.amber,
            ),
            onTap: onCalenderTap,
          ),
        ],
      ),
    );
  }
}
