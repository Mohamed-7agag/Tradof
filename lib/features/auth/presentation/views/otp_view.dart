import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_style.dart';
import '../widgets/auth_shape.dart';
import '../widgets/otp_widget_and_button.dart';

class OtpView extends StatelessWidget {
  const OtpView({required this.pageController, super.key});
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const AuthShape(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                SlideInLeft(
                  from: 400,
                  child: Text('Enter OTP',
                      style: AppStyle.robotoCondensedSemiBold32),
                ),
                verticalSpace(20),
                Text(
                  "Enter the OTP code we just sent you on your\nregistered Email/Phone number",
                  style: AppStyle.robotoRegular12
                      .copyWith(color: AppColors.darkGrey),
                  textAlign: TextAlign.center,
                ),
                verticalSpace(32),
                OtpWidgetAndButton(pageController: pageController),
                verticalSpace(16),
                SlideInLeft(
                  from: 400,
                  delay: const Duration(milliseconds: 250),
                  child: Row(
                    children: [
                      Text("Didn't receive OTP? ",
                          style: AppStyle.robotoRegular12),
                      Text(
                        'Resend OTP',
                        style: AppStyle.robotoRegular12.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
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
