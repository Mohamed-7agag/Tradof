import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/utils/widgets/custom_app_bar.dart';
import '../../../../profile/company_profile/data/model/company_model.dart';
import '../widgets/company_setting_profile_info.dart';
import '../widgets/company_setting_section1.dart';
import '../widgets/company_setting_section2.dart';
import '../widgets/subscription_plan_and_timer.dart';

class CompanySettingView extends StatelessWidget {
  const CompanySettingView({required this.companyModel, super.key});
  final CompanyModel companyModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        customAppbar(
          title: 'Settings',
          actionIcon: HugeIcons.strokeRoundedSettings02,
          titlePadding: 16.w,
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
                    delay: const Duration(milliseconds: 120),
                    child: CompanySettingsSection1(
                      companyModel: companyModel,
                    ),
                  ),
                  verticalSpace(20),
                  SlideInLeft(
                    from: 400,
                    delay: const Duration(milliseconds: 240),
                    child: const CompanySettingSection2(),
                  ),
                  verticalSpace(26),
                  const SubscriptionPlanAndTimer(),
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
