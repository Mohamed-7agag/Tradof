import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tradof/core/helpers/extensions.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/utils/widgets/custom_button.dart';
import '../../../../core/utils/widgets/custom_text_field.dart';

class ResetPasswordForm extends StatelessWidget {
  const ResetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            CustomTextField(
              labelText: 'New Password',
              controller: TextEditingController(),
              keyboardType: TextInputType.text,
              obscureText: true,
            ),
            verticalSpace(12),
            CustomTextField(
              labelText: 'Confirm Password',
              controller: TextEditingController(),
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
