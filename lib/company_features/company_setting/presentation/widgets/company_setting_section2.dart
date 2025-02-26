import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import 'setting_item.dart';

class CompanySettingSection2 extends StatelessWidget {
  const CompanySettingSection2({super.key});
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
            title: 'Change password',
            icon: const HugeIcon(
              icon: HugeIcons.strokeRoundedSquareLockPassword,
              color: Colors.red,
              size: 26,
            ),
            onTap: () {
              context.pushNamed(Routes.changeCompanyPasswordViewRoute);
            },
          ),
          const Divider(color: AppColors.cardDarkColor),
          SettingItem(
            title: 'Technical Support',
            icon: const HugeIcon(
              icon: HugeIcons.strokeRoundedCustomerService02,
              color: Colors.teal,
            ),
            onTap: () {},
          ),
          const Divider(color: AppColors.cardDarkColor),
          SettingItem(
            title: 'Give us feedback',
            icon: HugeIcon(
              icon: HugeIcons.strokeRoundedComment01,
              color: Colors.blue[600]!,
            ),
            onTap: () {
              context.pushNamed(Routes.feedbackViewRoute);
            },
          ),
        ],
      ),
    );
  }
}
