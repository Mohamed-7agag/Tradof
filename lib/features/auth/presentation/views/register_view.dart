import 'package:flutter/material.dart';

import '../widgets/create_account_countainer_curve.dart';
import '../widgets/register_form.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({required this.pageController, super.key});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CreateAccountContainerCurve(),
        RegisterForm(pageController: pageController),
      ],
    );
  }
}
