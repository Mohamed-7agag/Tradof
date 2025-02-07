import 'package:flutter/material.dart';

import '../widgets/create_account_countainer_curve.dart';
import '../widgets/register_form.dart';

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
