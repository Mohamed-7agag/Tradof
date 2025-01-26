import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tradof/core/theming/app_colors.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/utils/widgets/custom_button.dart';
import '../../../../core/utils/widgets/custom_text_field.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return Form(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          CustomTextField(
            labelText: 'First Name',
            labelColor: AppColors.white,
            controller: TextEditingController(),
            keyboardType: TextInputType.text,
          ),
          verticalSpace(12),
          CustomTextField(
            labelText: 'Last Name',
            labelColor: AppColors.white,
            controller: TextEditingController(),
            keyboardType: TextInputType.text,
          ),
          verticalSpace(12),
          CustomTextField(
            labelText: 'Email',
            labelColor: AppColors.white,
            controller: TextEditingController(),
            keyboardType: TextInputType.emailAddress,
          ),
          verticalSpace(12),
          CustomTextField(
            labelText: 'Phone Number',
            labelColor: AppColors.white,
            controller: TextEditingController(),
            keyboardType: TextInputType.number,
          ),
          verticalSpace(12),
          CustomTextField(
            labelText: 'Password',
            labelColor: AppColors.white,
            controller: TextEditingController(),
            keyboardType: TextInputType.text,
            obscureText: true,
          ),
          verticalSpace(12),
          CustomTextField(
            labelText: 'Confirm Password',
            labelColor: AppColors.white,
            controller: TextEditingController(),
            keyboardType: TextInputType.text,
            obscureText: true,
          ),
          verticalSpace(50),
          CustomButton(
            text: 'Continue',
            color: AppColors.lightOrange,
            onPressed: () {
              FocusManager.instance.primaryFocus?.unfocus();
              pageController.nextPage(
                duration: const Duration(milliseconds: 350),
                curve: Curves.easeInOut,
              );
            },
          ),
          verticalSpace(20),
        ],
      ),
    ));
  }
}
