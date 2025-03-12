import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../../core/helpers/extensions.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../profile/company_profile/data/model/company_model.dart';
import '../../../../profile/company_profile/presentation/logic/company_profile_cubit/company_profile_cubit.dart';
import 'setting_item.dart';

class CompanySettingsSection1 extends StatelessWidget {
  const CompanySettingsSection1({required this.companyModel, super.key});
  final CompanyModel companyModel;
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
          const Divider(color: AppColors.cardDarkColor),
          SettingItem(
            title: 'Notification',
            icon: const HugeIcon(
              icon: HugeIcons.strokeRoundedNotification03,
              color: AppColors.primary,
            ),
            onTap: () {},
          ),
          const Divider(color: AppColors.cardDarkColor),
          SettingItem(
            title: 'Clander',
            icon: const HugeIcon(
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
