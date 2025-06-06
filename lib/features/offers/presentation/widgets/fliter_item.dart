import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_style.dart';

class FliterItem extends StatelessWidget {
  const FliterItem({
    required this.title,
    required this.isSelected,
    super.key,
  });
  final String title;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8.w),
      height: 34,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: isSelected ? AppColors.primary : AppColors.white,
        border: Border.all(
          color: isSelected ? AppColors.primary : AppColors.grey,
        ),
      ),
      child: Center(
        child: Text(
          title,
          style: AppStyle.robotoRegular10.copyWith(
            color: isSelected ? AppColors.white : AppColors.black,
          ),
        ),
      ),
    );
  }
}
