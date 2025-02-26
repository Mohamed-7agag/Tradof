import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_style.dart';

class Rating extends StatelessWidget {
  const Rating({required this.rating, super.key});

  final int rating;

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
                'Rating',
                style: AppStyle.robotoMedium10.copyWith(
                  color: AppColors.white,
                ),
              ),
              verticalSpace(10),
            ],
          ),
          horizontalSpace(6),
          Row(
            children: [
              Text(
                '$rating',
                style: AppStyle.robotoSemiBold12
                    .copyWith(color: AppColors.white, fontSize: 18.sp),
              ),
              horizontalSpace(5),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Icon(
                  size: 22,
                  Icons.star,
                  color: Colors.yellow[600],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
