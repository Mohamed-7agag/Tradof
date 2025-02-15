import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:tradof/core/helpers/spacing.dart';

import '../../../../../core/utils/widgets/custom_app_bar.dart';
import '../../../company_profile/data/model/company_model.dart';
import '../widgets/company_setting_profile_info.dart';
import '../widgets/company_setting_section1.dart';
import '../widgets/company_setting_section2.dart';
import '../widgets/delete_account_and_logout_section.dart';
import '../widgets/subscription_plan_and_timer.dart';

class CompanySettingView extends StatelessWidget {
  const CompanySettingView({super.key, required this.companyModel});
  final CompanyModel companyModel;

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
                    child: CompanySettingProfileInfo(
                      companyModel: companyModel,
                    ),
                  ),
                  verticalSpace(20),
                  SlideInLeft(
                    from: 400,
                    delay: Duration(milliseconds: 120),
                    child: CompanySettingsSection1(
                      companyModel: companyModel,
                    ),
                  ),
                  verticalSpace(20),
                  SlideInLeft(
                    from: 400,
                    delay: Duration(milliseconds: 240),
                    child: CompanySettingSection2(),
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
