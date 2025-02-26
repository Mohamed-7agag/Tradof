import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theming/app_colors.dart';
import '../../theming/app_style.dart';

class CustomFailureWidget extends StatelessWidget {
  const CustomFailureWidget({
    required this.text,
    super.key,
    this.textColor,
    this.onRetry,
  });
  final String text;
  final Color? textColor;
  final VoidCallback? onRetry;
  @override
  Widget build(BuildContext context) {
    return onRetry != null
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: AppStyle.poppinsMedium14.copyWith(color: textColor),
                textAlign: TextAlign.center,
              ),
              SizedBox(width: 1.sw, height: 16),
              ElevatedButton.icon(
                onPressed: onRetry,
                label: const Text('Try Again'),
                icon: const Icon(Icons.refresh, color: AppColors.white),
                style: IconButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: AppColors.white,
                ),
              ),
            ],
          )
        : Center(
            child: Text(
              text,
              style: AppStyle.poppinsMedium14.copyWith(color: textColor),
              textAlign: TextAlign.center,
            ),
          );
  }
}
