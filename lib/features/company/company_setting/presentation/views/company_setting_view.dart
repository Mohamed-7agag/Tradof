import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tradof/core/helpers/spacing.dart';
import 'package:tradof/core/theming/app_colors.dart';
import 'package:tradof/core/theming/app_style.dart';
import 'package:tradof/features/company/company_setting/presentation/widgets/company_setting_app_bar.dart';
import 'package:tradof/features/company/company_setting/presentation/widgets/setting_section1.dart';
import 'package:tradof/features/company/company_setting/presentation/widgets/setting_section2.dart';
import 'package:tradof/features/company/company_setting/presentation/widgets/subscription_plan_and_timer.dart';
import 'package:tradof/features/company/company_setting/presentation/widgets/user_info_in_setting.dart';

class CompanySettingView extends StatelessWidget {
  const CompanySettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          CompanySettingAppbar(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  verticalSpace(15),
                  UserInfoInSetting(),
                  verticalSpace(20),
                  SettingsSection1(),
                  verticalSpace(20),
                  SettingSection2(),
                  verticalSpace(26),
                  SubscriptionPlanAndTimer(),
                  verticalSpace(20),
                  
                  verticalSpace(20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


