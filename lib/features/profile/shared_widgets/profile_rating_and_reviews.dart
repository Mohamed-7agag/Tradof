import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../../../core/helpers/spacing.dart';
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
      ],
    );
  }
}
