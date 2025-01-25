import 'package:flutter/material.dart';
import 'package:tradof/features/auth/presentation/widgets/create_account_countainer_curve.dart';
import 'package:tradof/features/auth/presentation/widgets/register_form.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CreateAccountContainerCurve(),
        RegisterForm(pageController: pageController),
      ],
    );
  }
}
