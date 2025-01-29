import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tradof/core/theming/app_colors.dart';
import 'package:tradof/features/auth/presentation/widgets/phone_number_text_field.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/utils/widgets/custom_button.dart';
import '../../../../core/utils/widgets/custom_text_field.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key, required this.pageController});
  final PageController pageController;

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  late final GlobalKey<FormState> formKey;

  late final TextEditingController emailController;
  late final TextEditingController phoneNumberController;
  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;

  @override
  void initState() {
    formKey = GlobalKey<FormState>();
    emailController = TextEditingController();
    phoneNumberController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              SlideInRight(
                from: 400,
                child: CustomTextField(
                  labelText: 'Email',
                  labelColor: AppColors.white,
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              verticalSpace(12),
              SlideInRight(
                from: 400,
                delay: Duration(milliseconds: 125),
                child: PhoneNumberTextField(
                  labelText: 'Phone Number',
                  controller: phoneNumberController,
                ),
              ),
              verticalSpace(6),
              SlideInRight(
                from: 400,
                delay: Duration(milliseconds: 250),
                child: CustomTextField(
                  labelText: 'Password',
                  labelColor: AppColors.white,
                  controller: passwordController,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                ),
              ),
              verticalSpace(12),
              SlideInRight(
                from: 400,
                delay: Duration(milliseconds: 375),
                child: CustomTextField(
                  labelText: 'Confirm Password',
                  labelColor: AppColors.white,
                  controller: confirmPasswordController,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                ),
              ),
              verticalSpace(50),
              SlideInUp(
                from: 400,
                delay: Duration(milliseconds: 500),
                child: CustomButton(
                  text: 'Continue',
                  color: AppColors.lightOrange,
                  onPressed: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    widget.pageController.nextPage(
                      duration: const Duration(milliseconds: 350),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
              ),
              verticalSpace(20),
            ],
          ),
        ));
  }
}
