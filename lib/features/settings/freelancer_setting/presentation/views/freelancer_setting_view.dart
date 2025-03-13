import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/extensions.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../profile/freelancer_profile/data/model/freelancer_model.dart';
import '../../../../profile/freelancer_profile/presentation/logic/freelancer_profile_cubit/freelancer_profile_cubit.dart';
import '../../../shared_widgets/logout_dialog.dart';
import '../../../shared_widgets/setting_app_bar.dart';
import '../../../shared_widgets/setting_profile_info.dart';
import '../../../shared_widgets/setting_section1.dart';
import '../../../shared_widgets/setting_section2.dart';
import '../../../shared_widgets/subscription_plan_and_timer.dart';

class FreelancerSettingView extends StatelessWidget {
  const FreelancerSettingView({required this.freelancerModel, super.key});
  final FreelancerModel freelancerModel;
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
                          '${freelancerModel.firstName} ${freelancerModel.lastName}',
                      email: freelancerModel.email,
                      role: 'Freelancer',
                      profileImageUrl: freelancerModel.profileImageUrl,
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
                      onCalenderTap: () {
                        context.pushNamed(Routes.calendarViewRoute);
                      },
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
                          arguments: true,
                        );
                      },
                      onGiveUsFeedbackTap: () {
                        context.pushNamed(Routes.feedbackViewRoute);
                      },
                      onLogoutTap: () => showLogoutDialog(context),
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
      Routes.updateFreelancerProfileViewRoute,
      arguments: freelancerModel,
    );

    if (result == true && context.mounted) {
      context.read<FreelancerProfileCubit>().getFreelancerProfile();
    }
  }
}
