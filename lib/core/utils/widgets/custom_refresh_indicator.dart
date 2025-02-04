import 'package:flutter/material.dart';

import '../../theming/app_colors.dart';

class CustomRefreshIndicator extends StatelessWidget {
  const CustomRefreshIndicator({
    super.key,
    required this.child,
    required this.onRefresh,
    this.reversColors = false,
  });
  final Widget child;
  final bool reversColors;
  final Future<void> Function() onRefresh;
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      color: reversColors ? AppColors.primary : AppColors.white,
      backgroundColor: reversColors ? AppColors.white : AppColors.primary,
      child: child,
    );
  }
}
