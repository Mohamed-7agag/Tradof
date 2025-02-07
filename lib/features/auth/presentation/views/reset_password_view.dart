import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_style.dart';
import '../widgets/auth_shape.dart';
import '../widgets/reset_password_form.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          AuthShape(),
          SlideInLeft(
            from: 400,
            child: Text(
              'Reset Password',
              style: AppStyle.robotoExtraBold32,
            ),
          ),
          verticalSpace(30),
          ResetPasswordForm(),
        ],
      ),
    );
  }
}
