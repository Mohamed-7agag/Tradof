import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../theming/app_colors.dart';

class ObscureIcon extends StatelessWidget {
  const ObscureIcon({
    super.key,
    required this.isObscure,
    required this.onPressed,
    this.labelColor,
  });

  final bool isObscure;
  final Color? labelColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: HugeIcon(
        icon: isObscure
            ? HugeIcons.strokeRoundedView
            : HugeIcons.strokeRoundedViewOff,
        color: labelColor ?? AppColors.primary,
      ),
      onPressed: onPressed,
    );
  }
}
