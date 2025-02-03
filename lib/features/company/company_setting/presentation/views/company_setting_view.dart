import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tradof/core/di/di.dart';
import 'package:tradof/core/helpers/spacing.dart';
import 'package:tradof/core/utils/widgets/custom_failure_widget.dart';
import 'package:tradof/core/utils/widgets/custom_loading_widget.dart';
import 'package:tradof/features/company/company_setting/presentation/widgets/company_setting_app_bar.dart';
import 'package:tradof/features/company/company_setting/presentation/widgets/setting_section1.dart';
import 'package:tradof/features/company/company_setting/presentation/widgets/setting_section2.dart';
import 'package:tradof/features/company/company_setting/presentation/widgets/subscription_plan_and_timer.dart';
import 'package:tradof/features/company/profile_company/presentation/logic/company_profile_cubit/company_profile_cubit.dart';

import '../widgets/delete_account_and_logout_section.dart';

class CompanySettingView extends StatelessWidget {
  const CompanySettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CompanyProfileCubit(getIt())..getCompanyProfile(),
      child: Column(
        children: [
          CompanySettingAppbar(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: SingleChildScrollView(
                child: BlocBuilder<CompanyProfileCubit, CompanyProfileState>(
                  builder: (context, state) {
                    if (state.status ==
                        CompanyProfileStatus.companyDataFetched) {
                      return Column(
                        children: [
                          verticalSpace(15),
                          SettingsSection1(companyModel: state.companyModel!),
                          verticalSpace(20),
                          SettingSection2(),
                          verticalSpace(26),
                          SubscriptionPlanAndTimer(),
                          verticalSpace(20),
                          DeleteAccountAndLogoutSection(),
                          verticalSpace(40),
                        ],
                      );
                    } else if (state.status == CompanyProfileStatus.error) {
                      return CustomFailureWidget(text: state.errorMessage);
                    }
                    return CustomLoadingWidget();
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
