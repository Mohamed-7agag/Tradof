import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_style.dart';
import '../widgets/auth_shape.dart';
import '../widgets/have_and_have_not_account_section.dart';
import '../widgets/login_form.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                SlideInDown(from: 200, child: const AuthShape()),
                SlideInDown(
                  child: Text(
                    'Login',
                    style: AppStyle.robotoExtraBold32,
                  ),
                ),
                verticalSpace(25),
                const LoginForm(),
                const Spacer(),
                const HaveNotAccountSection(),
                verticalSpace(16),
              ],
            ),
          )
        ],
      ),
    );
  }
}
