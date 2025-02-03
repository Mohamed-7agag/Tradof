import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tradof/core/theming/app_colors.dart';
import 'package:tradof/features/company/company_setting/presentation/widgets/setting_item.dart';

class SettingSection2 extends StatelessWidget {
  const SettingSection2({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 14.w),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          SettingItem(
            title: 'Change password',
            icon: 'assets/images/password.svg',
            onTap: () {},
          ),
          Divider(color: AppColors.cardDarkColor),
          SettingItem(
            title: 'Technical Support',
            icon: 'assets/images/support.svg',
            onTap: () {},
          ),
          Divider(color: AppColors.cardDarkColor),
          SettingItem(
            title: 'Give us feedback',
            icon: 'assets/images/feedback.svg',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
