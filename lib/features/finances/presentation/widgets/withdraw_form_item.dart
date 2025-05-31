import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_style.dart';

class WithdrawFormItem extends StatelessWidget {
  const WithdrawFormItem({
    required this.controller,
    required this.hintText,
    required this.labelText,
    super.key, this.keyboardType,
    this.isRequired = true,
  });
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final TextInputType? keyboardType;
  final bool isRequired;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(labelText, style: AppStyle.robotoSemiBold12),
            if (isRequired) const Text(' *', style: TextStyle(color: Colors.red)),
          ],
        ),
        verticalSpace(5),
        TextField(
          cursorColor: AppColors.primary,
          keyboardType: keyboardType,
          style: AppStyle.robotoRegular15,
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.white,
            hintText: hintText,
            hintStyle:
                AppStyle.robotoRegular14.copyWith(color: Colors.grey.shade400),
            border: _oulineBorder(),
            focusedBorder: _oulineBorder(color: AppColors.primary),
            enabledBorder: _oulineBorder(),
          ),
        ),
      ],
    );
  }

  OutlineInputBorder _oulineBorder({Color? color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(color: color ?? Colors.grey.shade200),
    );
  }
}
