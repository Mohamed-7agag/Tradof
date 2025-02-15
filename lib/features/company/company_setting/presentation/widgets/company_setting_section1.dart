import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:tradof/core/helpers/extensions.dart';
import 'package:tradof/core/routing/routes.dart';
import 'package:tradof/core/theming/app_colors.dart';
import 'package:tradof/features/company/company_profile/data/model/company_model.dart';
import 'package:tradof/features/company/company_profile/presentation/logic/company_profile_cubit/company_profile_cubit.dart';
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
            icon: HugeIcon(
              icon: HugeIcons.strokeRoundedUserAccount,
              color: Colors.green,
              size: 26,
            ),
            onTap: () async {
              final result = await context.pushNamed(
                Routes.updateCompanyProfileViewRoute,
                arguments: companyModel,
              );
              if (result == true && context.mounted) {
                context.read<CompanyProfileCubit>().getCompanyProfile();
              }
            },
          ),
          Divider(color: AppColors.cardDarkColor),
          SettingItem(
            title: 'Notification',
            icon: HugeIcon(
              icon: HugeIcons.strokeRoundedNotification03,
              color: AppColors.primary,
            ),
            onTap: () {},
          ),
          Divider(color: AppColors.cardDarkColor),
          SettingItem(
            title: 'Clander',
            icon: HugeIcon(
              icon: HugeIcons.strokeRoundedCalendar02,
              color: Colors.amber,
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
