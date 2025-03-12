import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/app_colors.dart';
import 'rating.dart';
import 'reviews.dart';

class ProfileRatingAndReviews extends StatelessWidget {
  const ProfileRatingAndReviews({
    required this.ratingSum,
    required this.reviewCount,
    super.key,
  });
  final int ratingSum;
  final int reviewCount;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 6,
          child: SlideInLeft(
            from: 400,
            child: Rating(ratingSum: ratingSum),
          ),
        ),
        horizontalSpace(8),
        Expanded(
          flex: 5,
          child: SlideInLeft(
            from: 400,
            delay: const Duration(milliseconds: 120),
            child: Reviews(reviewCount: reviewCount),
          ),
        ),
        horizontalSpace(8),
        Expanded(
          flex: 2,
          child: SlideInRight(
            from: 400,
            delay: const Duration(milliseconds: 240),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: const HugeIcon(
                icon: HugeIcons.strokeRoundedShare08,
                color: AppColors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}
