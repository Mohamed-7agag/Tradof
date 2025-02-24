import 'package:flutter/material.dart';

import '../../helpers/spacing.dart';
import '../../theming/app_colors.dart';

class CustomLinearProgressIndicator extends StatelessWidget {
  const CustomLinearProgressIndicator({
    required this.progress,
    super.key,
    this.endText,
  });
  final double progress;
  final String? endText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          LinearProgressIndicator(
            value: progress,
            backgroundColor: AppColors.grey,
            valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(10),
          ),
          verticalSpace(16),
          Text(
            '${(progress * 100).toStringAsFixed(1)}% ${endText ?? 'Upload'}',
          ),
        ],
      ),
    );
  }
}
