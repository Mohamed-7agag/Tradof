import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:tradof/core/theming/app_colors.dart';
import 'package:tradof/features/company/company_setting/presentation/widgets/setting_item.dart';

class SettingsSection1 extends StatelessWidget {
  const SettingsSection1({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.cardColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h),
          child: Column(
            children: [
              SettingItem(
                title: 'Notification',
                icon: 'assets/images/notification.svg',
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.w),
                child: Divider(),
              ),
              SettingItem(
                title: 'Clander',
                icon: 'assets/images/calendar.svg',
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.w),
                child: Divider(),
              ),
              SettingItem(
                title: 'Technical Support',
                icon: 'assets/images/support.svg',
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.w),
                child: Divider(),
              ),
              SettingItem(
                title: 'Give us feedback',
                icon: 'assets/images/feedback.svg',
              ),
            ],
          ),
        ),
      ),
    );
  }
}