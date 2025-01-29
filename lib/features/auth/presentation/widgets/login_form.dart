import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tradof/core/helpers/extensions.dart';
import 'package:tradof/core/helpers/spacing.dart';
import 'package:tradof/core/routing/routes.dart';
import 'package:tradof/core/theming/app_style.dart';
import 'package:tradof/core/utils/widgets/custom_text_field.dart';
import 'package:tradof/features/auth/presentation/widgets/login_button_and_validation.dart';

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
              delay: Duration(milliseconds: 100),
              child: CustomTextField(
                labelText: 'Email',
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            verticalSpace(12),
            SlideInRight(
              from: 400,
              delay: Duration(milliseconds: 200),
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
                child:
                    Text('Forgot Password?', style: AppStyle.robotoRegular12),
              ),
            ),
            verticalSpace(50),
            SlideInUp(
              from: 400,
              delay: Duration(milliseconds: 300),
              child: LoginButtonAndValidation(
                formKey: formKey,
                emailController: emailController,
                passwordController: passwordController,
              ),
            )
          ],
        ),
      ),
    );
  }
}
