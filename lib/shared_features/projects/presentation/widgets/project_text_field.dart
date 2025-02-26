import 'package:flutter/material.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_style.dart';

class ProjectTextField extends StatelessWidget {
  const ProjectTextField({
    required this.labelText,
    required this.controller,
    super.key,
    this.keyboardType,
    this.labelColor,
    this.maxLines = 1,
    this.readOnly = false,
  });

  final String labelText;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final Color? labelColor;
  final int maxLines;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: labelColor ?? AppColors.darkGrey,
      cursorRadius: const Radius.circular(10),
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      readOnly: readOnly,
      style: AppStyle.robotoRegular15.copyWith(color: labelColor),
      validator: (value) {
        if (value!.trim().isNullOrEmpty()) {
          return 'required';
        }
        return null;
      },
      decoration: InputDecoration(
          border: _buildBorder(),
          enabledBorder: _buildBorder(),
          focusedErrorBorder: _buildBorder(),
          focusedBorder: _buildBorder(color: labelColor ?? AppColors.darkGrey),
          errorBorder: _buildBorder(color: Colors.red),
          labelText: labelText,
          floatingLabelStyle: const TextStyle(color: AppColors.darkGrey),
          floatingLabelBehavior: FloatingLabelBehavior.always),
    );
  }

  _buildBorder({Color? color}) {
    return OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      borderSide: BorderSide(color: color ?? AppColors.grey),
    );
  }
}
