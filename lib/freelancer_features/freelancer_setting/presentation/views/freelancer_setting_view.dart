import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/utils/widgets/custom_app_bar.dart';
import '../../../../company_features/company_setting/presentation/widgets/delete_account_and_logout_section.dart';
import '../../../../company_features/company_setting/presentation/widgets/subscription_plan_and_timer.dart';
import '../../../freelancer_profile/data/model/freelancer_model.dart';
import '../widgets/freelancer_setting_profile_info.dart';
import '../widgets/freelancer_setting_section1.dart';
import '../widgets/freelancer_setting_section2.dart';

class FreelancerSettingView extends StatelessWidget {
  const FreelancerSettingView({required this.freelancerModel, super.key});
  final FreelancerModel freelancerModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        customAppbar(
          title: 'Settings',
          actionIcon: HugeIcons.strokeRoundedSettings02,
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  verticalSpace(15),
                  SlideInLeft(
                    from: 400,
                    child: FreelancerSettingProfileInfo(
                      freelancerModel: freelancerModel,
                    ),
                  ),
                  verticalSpace(20),
                  SlideInLeft(
                    from: 400,
                    delay: const Duration(milliseconds: 120),
                    child: FreelancerSettingsSection1(
                      freelancerModel: freelancerModel,
                    ),
                  ),
                  verticalSpace(20),
                  SlideInLeft(
                    from: 400,
                    delay: const Duration(milliseconds: 240),
                    child: const FreelancerSettingSection2(),
                  ),
                  verticalSpace(26),
                  const SubscriptionPlanAndTimer(),
                  verticalSpace(20),
                  const DeleteAccountAndLogoutSection(),
                  verticalSpace(100),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
