import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_style.dart';
import '../../../../core/utils/widgets/custom_text_field.dart';
import 'google_button.dart';
import 'login_button_and_validation.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late final GlobalKey<FormState> formKey;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    formKey = GlobalKey<FormState>();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
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
              delay: const Duration(milliseconds: 150),
              child: CustomTextField(
                labelText: 'Email',
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            verticalSpace(12),
            SlideInRight(
              from: 400,
              delay: const Duration(milliseconds: 300),
              child: CustomTextField(
                labelText: 'Password',
                controller: passwordController,
                keyboardType: TextInputType.text,
                obscureText: true,
              ),
            ),
            verticalSpace(10),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  context.pushNamed(Routes.forgetPasswordPageViewRoute);
                },
                child: Text(
                  'Forgot Password?',
                  style: AppStyle.robotoRegular12,
                ),
              ),
            ),
            verticalSpace(50),
            SlideInUp(
              from: 400,
              delay: const Duration(milliseconds: 450),
              child: LoginButtonAndValidation(
                formKey: formKey,
                emailController: emailController,
                passwordController: passwordController,
              ),
            ),
            verticalSpace(20),
            SlideInUp(
              from: 400,
              delay: const Duration(milliseconds: 600),
              child: const GoogleButton(),
            )
          ],
        ),
      ),
    );
  }
}
