import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tradof/core/theming/app_colors.dart';
import 'package:tradof/core/utils/widgets/custom_button.dart';
import 'package:tradof/features/auth/presentation/widgets/create_account_countainer_curve.dart';
import 'package:tradof/features/auth/presentation/widgets/select_account_type_section.dart';

import '../widgets/privacy_policy_check_box.dart';

class SelectAccountTypeView extends StatefulWidget {
  const SelectAccountTypeView({required this.pageController, super.key});
  final PageController pageController;

  @override
  State<SelectAccountTypeView> createState() => _SelectAccountTypeViewState();
}

class _SelectAccountTypeViewState extends State<SelectAccountTypeView> {
  bool isAgreed = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0.95.sh,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          const CreateAccountContainerCurve(),
          Positioned(
            top: 210.h,
            child: Column(
              children: [
                SlideInLeft(
                  from: 400,
                  child: const SelectAccountTypeSection(),
                ),
                SizedBox(
                  width: 1.sw,
                  child: PrivacyPolicyCheckBox(
                    onChanged: (isChecked) => isAgreed = isChecked,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 80.h,
            left: 16.w,
            right: 16.w,
            child: SlideInUp(
              from: 400,
              child: CustomButton(
                text: 'Continue',
                onPressed: () {
                  if (isAgreed) {
                    widget.pageController.nextPage(
                      duration: const Duration(milliseconds: 350),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                color: AppColors.lightOrange,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
