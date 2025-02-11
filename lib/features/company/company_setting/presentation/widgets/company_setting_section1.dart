import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tradof/core/routing/routes.dart';
import 'package:tradof/core/theming/app_colors.dart';
import 'package:tradof/features/company/company_profile/data/model/company_model.dart';
import 'package:tradof/features/company/company_setting/presentation/widgets/setting_item.dart';

class CompanySettingsSection1 extends StatelessWidget {
  const CompanySettingsSection1({super.key, required this.companyModel});
  final CompanyModel companyModel;
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
            title: 'Personal info',
            icon: 'assets/images/profile.svg',
            onTap: () {
              context.push(
                Routes.updateCompanyProfileViewRoute,
                extra: companyModel,
              );
            },
          ),
          Divider(color: AppColors.cardDarkColor),
          SettingItem(
            title: 'Notification',
            icon: 'assets/images/notification.svg',
            onTap: () {},
          ),
          Divider(color: AppColors.cardDarkColor),
          SettingItem(
            title: 'Clander',
            icon: 'assets/images/calendar.svg',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
