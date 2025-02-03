import 'package:flutter/material.dart';
import 'package:tradof/core/helpers/extensions.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_style.dart';
import 'obscure_icon.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.labelText,
    this.keyboardType,
    required this.controller,
    this.obscureText = false,
    this.labelColor,
    this.outlineBorder = false,
    this.labelBehavior=false,
  });

  final String labelText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final TextEditingController controller;
  final Color? labelColor;
  final bool outlineBorder;
  final bool? labelBehavior;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isObscure = true;

  @override
  void initState() {
    super.initState();
    _isObscure = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: widget.labelColor ?? AppColors.primary,
      cursorRadius: Radius.circular(10),
      obscureText: _isObscure,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      style: AppStyle.robotoRegular15.copyWith(color: widget.labelColor),
      validator: (value) {
        if (value!.trim().isNullOrEmpty()) {
          return 'required';
        }
        return null;
      },
      decoration: InputDecoration(
        suffixIcon: widget.obscureText
            ? ObscureIcon(
                isObscure: _isObscure,
                labelColor: widget.labelColor,
                onPressed: () {
                  setState(() => _isObscure = !_isObscure);
                },
              )
            : null,
        border: _buildBorder(),
        enabledBorder: _buildBorder(),
        focusedErrorBorder: _buildBorder(),
        focusedBorder:
            _buildBorder(color: widget.labelColor ?? AppColors.primary),
        errorBorder: _buildBorder(color: Colors.red),
        label: Text(
          widget.labelText,
          style: AppStyle.robotoRegular14.copyWith(color: widget.labelColor),
        ),
        floatingLabelStyle: TextStyle(color: AppColors.primary),
        floatingLabelBehavior: widget.labelBehavior==true?FloatingLabelBehavior.never:FloatingLabelBehavior.auto,
      ),
    );
  }

  _buildBorder({Color? color}) {
    return widget.outlineBorder
        ? OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: color ?? AppColors.grey),
          )
        : UnderlineInputBorder(
            borderSide: BorderSide(color: color ?? AppColors.grey),
          );
  }
}
