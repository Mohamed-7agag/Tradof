import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../profile/company_profile/data/model/company_model.dart';
import '../../../profile/company_profile/presentation/logic/company_profile_cubit/company_profile_cubit.dart';
import '../widgets/setting_app_bar.dart';
import '../widgets/setting_profile_info.dart';
import '../widgets/setting_section1.dart';
import '../widgets/setting_section2.dart';
import '../widgets/subscription_plan_and_timer.dart';

class CompanySettingView extends StatelessWidget {
  const CompanySettingView({required this.companyModel, super.key});
  final CompanyModel companyModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SettingAppBar(),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  verticalSpace(15),
                  SlideInLeft(
                    from: 400,
                    child: SettingProfileInfo(
                      userName:
                          '${companyModel.firstName} ${companyModel.lastName}',
                      email: companyModel.email,
                      role: 'Company',
                      profileImageUrl: companyModel.profileImageUrl,
                    ),
                  ),
                  verticalSpace(20),
                  SlideInLeft(
                    from: 400,
                    delay: const Duration(milliseconds: 120),
                    child: SettingsSection1(
                      onPersonalInfoTap: () async {
                        await _onPersonalInfoTap(context);
                      },
                      onNotificationTap: () {},
                    ),
                  ),
                  verticalSpace(20),
                  SlideInLeft(
                    from: 400,
                    delay: const Duration(milliseconds: 240),
                    child: SettingSection2(
                      onChangePasswordTap: () {
                        context.pushNamed(
                          Routes.changePasswordViewRoute,
                          arguments: false,
                        );
                      },
                      onTechnicalSupportTap: () {},
                    ),
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

  Future<void> _onPersonalInfoTap(BuildContext context) async {
    final result = await context.pushNamed(
      Routes.updateCompanyProfileViewRoute,
      arguments: companyModel,
    );
    if (result == true && context.mounted) {
      context.read<CompanyProfileCubit>().getCompanyProfile();
    }
  }
}
