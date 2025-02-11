import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tradof/core/helpers/extensions.dart';
import 'package:tradof/core/routing/routes.dart';
import 'package:tradof/core/theming/app_colors.dart';

import 'setting_item.dart';

class CompanySettingSection2 extends StatelessWidget {
  const CompanySettingSection2({super.key});
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
              context.pushNamed(Routes.changeCompanyPasswordViewRoute);
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
