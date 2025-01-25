import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tradof/core/theming/app_colors.dart';
import 'package:tradof/core/utils/widgets/custom_button.dart';
import 'package:tradof/features/auth/presentation/widgets/create_account_countainer_curve.dart';
import 'package:tradof/features/auth/presentation/widgets/select_account_type_section.dart';

import '../widgets/privacy_policy_check_box.dart';

class SelectAccountTypeView extends StatelessWidget {
  const SelectAccountTypeView({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        CreateAccountContainerCurve(),
        Positioned(
          top: 210.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SelectAccountTypeSection(),
              SizedBox(
                width: 1.sw,
                child: PrivacyPolicyCheckBox(),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 80.h,
          left: 16.w,
          right: 16.w,
          child: CustomButton(
            text: 'Continue',
            onPressed: () {
              pageController.nextPage(
                duration: const Duration(milliseconds: 350),
                curve: Curves.easeInOut,
              );
            },
            color: AppColors.lightOrange,
          ),
        ),
      ],
    );
  }
}
