import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tradof/core/theming/app_colors.dart';

import '../../../../company/company_setting/presentation/widgets/setting_item.dart';

class FreelancerSettingSection2 extends StatelessWidget {
  const FreelancerSettingSection2({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 14.w),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          SettingItem(
            title: 'Change password',
            icon: 'assets/images/password.svg',
            onTap: () {
              //
            },
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
