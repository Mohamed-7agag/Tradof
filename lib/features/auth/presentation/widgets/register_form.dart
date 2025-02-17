import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/app_validation.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/utils/widgets/custom_button.dart';
import '../../../../core/utils/widgets/custom_text_field.dart';
import '../../../../core/utils/widgets/custom_toastification.dart';
import '../logic/registeration_cubit/registeration_cubit.dart';
import 'phone_number_text_field.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({required this.pageController, super.key});
  final PageController pageController;

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  late final GlobalKey<FormState> formKey;

  late final TextEditingController emailController;
  late final TextEditingController firstNameController;
  late final TextEditingController lastNameController;
  late final TextEditingController phoneNumberController;
  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;

  @override
  void initState() {
    formKey = GlobalKey<FormState>();
    emailController = TextEditingController();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    phoneNumberController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
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
                  labelText: 'First Name',
                  labelColor: AppColors.white,
                  controller: firstNameController,
                  keyboardType: TextInputType.text,
                ),
              ),
              verticalSpace(12),
              SlideInRight(
                from: 400,
                delay: const Duration(milliseconds: 100),
                child: CustomTextField(
                  labelText: 'Last Name',
                  labelColor: AppColors.white,
                  controller: lastNameController,
                  keyboardType: TextInputType.text,
                ),
              ),
              verticalSpace(12),
              SlideInRight(
                from: 400,
                delay: const Duration(milliseconds: 200),
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
                delay: const Duration(milliseconds: 300),
                child: PhoneNumberTextField(
                  labelText: 'Phone Number',
                  controller: phoneNumberController,
                ),
              ),
              verticalSpace(2),
              SlideInRight(
                from: 400,
                delay: const Duration(milliseconds: 400),
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
                delay: const Duration(milliseconds: 500),
                child: CustomTextField(
                  labelText: 'Confirm Password',
                  labelColor: AppColors.white,
                  controller: confirmPasswordController,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                ),
              ),
              verticalSpace(45),
              SlideInUp(
                from: 400,
                delay: const Duration(milliseconds: 600),
                child: CustomButton(
                  text: 'Continue',
                  color: AppColors.lightOrange,
                  onPressed: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    _registerFormValidation();
                  },
                ),
              ),
              verticalSpace(20),
            ],
          ),
        ));
  }

  _registerFormValidation() {
    final String email = emailController.text.trim();
    final String phoneNumber = phoneNumberController.text.trim();
    final String password = passwordController.text.trim();
    final String confirmPassword = confirmPasswordController.text.trim();

    if (formKey.currentState!.validate()) {
      if (!AppValidation.emailValidation(context, email) ||
          !AppValidation.phoneNumberValidation(context, phoneNumber)) {
      } else if (password != confirmPassword) {
        errorToast(context, 'Invalid Password', 'Passwords do not match');
      } else if (!AppValidation.passwordValidation(context, password)) {
      } else {
        widget.pageController.nextPage(
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeInOut,
        );
        context.read<RegisterationCubit>().setCommonRegisterationData(
              firstNameController.text.trim(),
              lastNameController.text.trim(),
              email,
              phoneNumber,
              password,
            );
      }
    }
  }
}
