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
  });

  final String labelText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final TextEditingController controller;

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
      cursorColor: AppColors.primary,
      obscureText: _isObscure,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
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
                onPressed: () {
                  setState(() => _isObscure = !_isObscure);
                },
              )
            : null,
        border: _buildBorder(),
        enabledBorder: _buildBorder(),
        focusedErrorBorder: _buildBorder(),
        focusedBorder: _buildBorder(color: AppColors.primary),
        errorBorder: _buildBorder(color: Colors.red),
        label: Text(widget.labelText, style: AppStyle.robotoRegular14),
        floatingLabelStyle: TextStyle(color: AppColors.primary),
      ),
    );
  }

  UnderlineInputBorder _buildBorder({Color? color}) {
    return UnderlineInputBorder(
      borderSide: BorderSide(color: color ?? AppColors.grey),
    );
  }
}
