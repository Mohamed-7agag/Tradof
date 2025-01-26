import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tradof/core/helpers/spacing.dart';
import 'package:tradof/core/theming/app_colors.dart';
import 'package:tradof/features/auth/presentation/widgets/otp_widget.dart';

import '../../../../core/theming/app_style.dart';
import '../../../../core/utils/widgets/custom_button.dart';
import '../widgets/auth_shape.dart';

class OtpView extends StatelessWidget {
  const OtpView({super.key, required this.pageController});
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
                Text('Enter OTP', style: AppStyle.robotoCondensedSemiBold32),
                verticalSpace(20),
                Text(
                  "Enter the OTP code we just sent you on your\nregistered Email/Phone number",
                  style: AppStyle.robotoRegular12
                      .copyWith(color: AppColors.darkGrey),
                  textAlign: TextAlign.center,
                ),
                verticalSpace(32),
                OtpWidget(),
                verticalSpace(38),
                CustomButton(
                  text: 'Reset Password',
                  onPressed: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    pageController.nextPage(
                      duration: Duration(milliseconds: 350),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
                verticalSpace(16),
                Row(
                  children: [
                    Text('Didn\'t receive OTP? ',
                        style: AppStyle.robotoRegular12),
                    Text(
                      'Resend OTP',
                      style: AppStyle.robotoRegular12
                          .copyWith(color: AppColors.primary),
                    ),
                  ],
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
