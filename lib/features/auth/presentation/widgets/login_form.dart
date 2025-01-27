import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tradof/core/helpers/extensions.dart';
import 'package:tradof/core/helpers/spacing.dart';
import 'package:tradof/core/routing/routes.dart';
import 'package:tradof/core/theming/app_style.dart';
import 'package:tradof/core/utils/widgets/custom_button.dart';
import 'package:tradof/core/utils/widgets/custom_text_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  @override
  void initState() {
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
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          CustomTextField(
            labelText: 'Email',
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
          ),
          verticalSpace(12),
          CustomTextField(
            labelText: 'Password',
            controller: passwordController,
            keyboardType: TextInputType.text,
            obscureText: true,
          ),
          verticalSpace(10),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {
                context.pushNamed(Routes.forgetPasswordPageViewRoute);
              },
              child: Text('Forgot Password?', style: AppStyle.robotoRegular12),
            ),
          ),
          verticalSpace(50),
          SlideInUp(
            from: 400,
            child: CustomButton(
              text: 'Login',
              onPressed: () {
                FocusManager.instance.primaryFocus?.unfocus();
              },
            ),
          )
        ],
      ),
    ));
  }
}
