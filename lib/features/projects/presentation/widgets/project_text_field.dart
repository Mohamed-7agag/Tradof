import 'package:flutter/material.dart';
import 'package:tradof/core/helpers/extensions.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_style.dart';

class ProjectTextField extends StatelessWidget {
  const ProjectTextField({
    super.key,
    required this.labelText,
    this.keyboardType,
    required this.controller,
    this.labelColor,
    this.maxLines = 1,
  });

  final String labelText;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final Color? labelColor;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: labelColor ?? AppColors.darkGrey,
      cursorRadius: Radius.circular(10),
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
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
        focusedBorder:
            _buildBorder(color: labelColor ?? AppColors.darkGrey),
        errorBorder: _buildBorder(color: Colors.red),
        labelText: labelText,
        floatingLabelStyle: TextStyle(color: AppColors.darkGrey),
        floatingLabelBehavior: FloatingLabelBehavior.always
      ),
    );
  }

  _buildBorder({Color? color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: color ?? AppColors.grey),
    );
  }
}
