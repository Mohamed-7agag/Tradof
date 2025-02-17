import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tradof/core/utils/widgets/custom_text_field.dart';
import 'package:tradof/features/auth/presentation/widgets/forget_password_button.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_style.dart';
import '../widgets/auth_shape.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({required this.pageController, super.key});
  final PageController pageController;

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  late final TextEditingController emailController;
  @override
  void initState() {
    emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

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
                  child: Text(
                    'Forget Password',
                    style: AppStyle.robotoCondensedSemiBold32,
                  ),
                ),
                verticalSpace(20),
                Text(
                  'To reset your password, enter your email below and submit. An email will be sent to you with instructions about how to complete the process.',
                  style: AppStyle.robotoRegular12
                      .copyWith(color: AppColors.darkGrey),
                  textAlign: TextAlign.center,
                ),
                verticalSpace(30),
                SlideInRight(
                  from: 400,
                  delay: const Duration(milliseconds: 100),
                  child: CustomTextField(
                    labelText: 'Email',
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                verticalSpace(45),
                SlideInUp(
                  from: 400,
                  delay: const Duration(milliseconds: 200),
                  child: ForgetPasswordButton(
                    emailController: emailController,
                    pageController: widget.pageController,
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
