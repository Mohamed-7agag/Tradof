import 'package:flutter/material.dart';

import '../../../../core/utils/widgets/custom_button.dart';

class FeedbackButton extends StatelessWidget {
  const FeedbackButton({required this.controller, super.key});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: 'Send Feedback',
      onPressed: () {},
    );
  }
}
