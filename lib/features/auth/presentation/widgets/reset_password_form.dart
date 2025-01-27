import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tradof/core/helpers/extensions.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/utils/widgets/custom_button.dart';
import '../../../../core/utils/widgets/custom_text_field.dart';

class ResetPasswordForm extends StatefulWidget {
  const ResetPasswordForm({super.key});

  @override
  State<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;
  @override
  void initState() {
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
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
              labelText: 'New Password',
              controller: passwordController,
              keyboardType: TextInputType.text,
              obscureText: true,
            ),
            verticalSpace(12),
            CustomTextField(
              labelText: 'Confirm Password',
              controller: confirmPasswordController,
              keyboardType: TextInputType.text,
              obscureText: true,
            ),
            verticalSpace(50),
            CustomButton(
              text: 'Submit',
              onPressed: () {
                FocusManager.instance.primaryFocus?.unfocus();
                context.pop();
              },
            ),
            verticalSpace(25),
          ],
        ),
      ),
    );
  }
}
