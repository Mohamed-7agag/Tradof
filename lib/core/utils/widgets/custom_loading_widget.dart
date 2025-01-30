import 'package:flutter/material.dart';

import '../../theming/app_colors.dart';

class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({super.key, this.color});
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: color ?? AppColors.primary,
        strokeWidth: 2.5,
        strokeCap: StrokeCap.round,
      ),
    );
  }
}
