import 'package:flutter/material.dart';
import '../../theming/app_colors.dart';

class ObscureIcon extends StatelessWidget {
  const ObscureIcon({
    super.key,
    required this.isObscure,
    required this.onPressed,
  });

  final bool isObscure;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isObscure ? Icons.visibility : Icons.visibility_off,
        color: AppColors.primary,
      ),
      onPressed: onPressed,
    );
  }
}