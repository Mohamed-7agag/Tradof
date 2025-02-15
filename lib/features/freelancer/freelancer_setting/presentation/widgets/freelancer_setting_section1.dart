import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:tradof/core/helpers/extensions.dart';
import 'package:tradof/core/routing/routes.dart';
import 'package:tradof/core/theming/app_colors.dart';

import '../../../../company/company_setting/presentation/widgets/setting_item.dart';
import '../../../freelancer_profile/data/model/freelancer_model.dart';
import '../../../freelancer_profile/presentation/logic/freelancer_profile_cubit/freelancer_profile_cubit.dart';

class FreelancerSettingsSection1 extends StatelessWidget {
  const FreelancerSettingsSection1({super.key, required this.freelancerModel});
  final FreelancerModel freelancerModel;
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
                Routes.updateFreelancerProfileViewRoute,
                arguments: freelancerModel,
              );

              if (result == true && context.mounted) {
                context.read<FreelancerProfileCubit>().getFreelancerProfile();
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
