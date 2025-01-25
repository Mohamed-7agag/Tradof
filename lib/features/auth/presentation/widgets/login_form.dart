import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tradof/core/helpers/extensions.dart';
import 'package:tradof/core/helpers/spacing.dart';
import 'package:tradof/core/routing/routes.dart';
import 'package:tradof/core/theming/app_style.dart';
import 'package:tradof/core/utils/widgets/custom_button.dart';
import 'package:tradof/core/utils/widgets/custom_text_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          CustomTextField(
            labelText: 'Email',
            controller: TextEditingController(),
            keyboardType: TextInputType.emailAddress,
          ),
          verticalSpace(12),
          CustomTextField(
            labelText: 'Password',
            controller: TextEditingController(),
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
                  child: Text('Forgot Password?',
                      style: AppStyle.robotoRegular12))),
          verticalSpace(50),
          CustomButton(text: 'Login', onPressed: () {})
        ],
      ),
    ));
  }
}
