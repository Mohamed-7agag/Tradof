import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/theming/app_colors.dart';
import '../../../core/theming/app_style.dart';

class Reviews extends StatelessWidget {
  const Reviews({required this.reviewCount, super.key});

  final int reviewCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 12),
      decoration: const BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Reviews',
                style: AppStyle.robotoMedium10.copyWith(
                  color: AppColors.white,
                ),
              ),
              verticalSpace(10),
            ],
          ),
          Text(
            '$reviewCount',
            style: AppStyle.robotoSemiBold12.copyWith(
              color: AppColors.white,
              fontSize: 18.sp,
            ),
          ),
        ],
      ),
    );
  }
}
