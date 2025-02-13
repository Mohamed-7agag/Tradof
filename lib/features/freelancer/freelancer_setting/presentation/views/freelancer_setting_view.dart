import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tradof/core/utils/widgets/custom_app_bar.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../company/company_setting/presentation/widgets/delete_account_and_logout_section.dart';
import '../../../../company/company_setting/presentation/widgets/subscription_plan_and_timer.dart';
import '../../../freelancer_profile/data/model/freelancer_model.dart';
import '../widgets/freelancer_setting_profile_info.dart';
import '../widgets/freelancer_setting_section1.dart';
import '../widgets/freelancer_setting_section2.dart';

class FreelancerSettingView extends StatelessWidget {
  const FreelancerSettingView({super.key, required this.freelancerModel});
  final FreelancerModel freelancerModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        customAppbar(
          title: 'Settings',
          actionIcon: SvgPicture.asset('assets/images/setting.svg',
              colorFilter: const ColorFilter.mode(
                AppColors.white,
                BlendMode.srcIn,
              )),
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
                    delay: Duration(milliseconds: 200),
                    child: FreelancerSettingsSection1(
                      freelancerModel: freelancerModel,
                    ),
                  ),
                  verticalSpace(20),
                  SlideInLeft(
                    from: 400,
                    delay: Duration(milliseconds: 400),
                    child: FreelancerSettingSection2(),
                  ),
                  verticalSpace(26),
                  SubscriptionPlanAndTimer(),
                  verticalSpace(20),
                  DeleteAccountAndLogoutSection(),
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
