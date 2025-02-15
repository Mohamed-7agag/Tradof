import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:tradof/core/helpers/extensions.dart';
import 'package:tradof/core/routing/routes.dart';
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
            icon: HugeIcon(
              icon: HugeIcons.strokeRoundedSquareLockPassword,
              color: Colors.red,
              size: 26,
            ),
            onTap: () {
              context.pushNamed(Routes.changeFreelancerPasswordViewRoute);
            },
          ),
          Divider(color: AppColors.cardDarkColor),
          SettingItem(
            title: 'Technical Support',
            icon: HugeIcon(
              icon: HugeIcons.strokeRoundedCustomerService02,
              color: Colors.teal,
            ),
            onTap: () {},
          ),
          Divider(color: AppColors.cardDarkColor),
          SettingItem(
            title: 'Give us feedback',
            icon: HugeIcon(
              icon: HugeIcons.strokeRoundedComment01,
              color: Colors.blue[600]!,
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
