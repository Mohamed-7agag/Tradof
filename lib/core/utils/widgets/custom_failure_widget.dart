import 'package:flutter/material.dart';

import '../../theming/app_style.dart';

class CustomFailureWidget extends StatelessWidget {
  const CustomFailureWidget({required this.text, super.key, this.textColor});
  final String text;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: AppStyle.poppinsMedium14.copyWith(color: textColor),
        textAlign: TextAlign.center,
      ),
    );
  }
}
