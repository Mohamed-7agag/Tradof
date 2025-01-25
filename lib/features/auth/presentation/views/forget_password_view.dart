import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tradof/core/utils/widgets/custom_button.dart';
import 'package:tradof/core/utils/widgets/custom_text_field.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_style.dart';
import '../widgets/auth_shape.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          AuthShape(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                Text('Forget Password',
                    style: AppStyle.robotoCondensedSemiBold32),
                verticalSpace(20),
                Text(
                  'To reset your password, enter your email below and submit. An email will be sent to you with instructions about how to complete the process.',
                  style: AppStyle.robotoRegular12
                      .copyWith(color: AppColors.darkGrey),
                  textAlign: TextAlign.center,
                ),
                verticalSpace(30),
                CustomTextField(
                  labelText: 'Email',
                  controller: TextEditingController(),
                  keyboardType: TextInputType.emailAddress,
                ),
                verticalSpace(36),
                CustomButton(
                  text: 'Continue',
                  onPressed: () {
                    pageController.nextPage(
                      duration: Duration(milliseconds: 350),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
                verticalSpace(25),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
