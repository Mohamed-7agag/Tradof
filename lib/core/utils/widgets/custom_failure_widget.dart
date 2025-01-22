import 'package:flutter/material.dart';

import '../../helpers/spacing.dart';

class CustomFailureWidget extends StatelessWidget {
  const CustomFailureWidget({super.key, required this.text, this.textColor});
  final String text;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: AppStyle.styleRegular14.copyWith(color: textColor),
        textAlign: TextAlign.center,
      ),
    );
  }
}
