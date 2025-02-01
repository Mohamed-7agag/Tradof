import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tradof/core/helpers/spacing.dart';
import 'package:tradof/features/company/company_setting/presentation/widgets/company_setting_app_bar.dart';
import 'package:tradof/features/company/company_setting/presentation/widgets/setting_section1.dart';
import 'package:tradof/features/company/company_setting/presentation/widgets/setting_section2.dart';
import 'package:tradof/features/company/company_setting/presentation/widgets/subscription_plan_and_timer.dart';

import '../widgets/delete_account_and_logout_section.dart';

class CompanySettingView extends StatelessWidget {
  const CompanySettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CompanySettingAppbar(),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  verticalSpace(15),
                  SettingsSection1(),
                  verticalSpace(20),
                  SettingSection2(),
                  verticalSpace(26),
                  SubscriptionPlanAndTimer(),
                  verticalSpace(20),
                  DeleteAccountAndLogoutSection(),
                  verticalSpace(40),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
