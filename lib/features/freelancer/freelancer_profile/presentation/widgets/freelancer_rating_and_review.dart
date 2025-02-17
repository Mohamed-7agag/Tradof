import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../company/company_profile/presentation/widgets/rating.dart';
import '../../../../company/company_profile/presentation/widgets/reviews.dart';
import '../../data/model/freelancer_model.dart';

class FreelancerRatingAndReview extends StatelessWidget {
  const FreelancerRatingAndReview({required this.freelancerModel, super.key});
  final FreelancerModel freelancerModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 6,
          child: SlideInLeft(
            from: 400,
            child: Rating(rating: freelancerModel.ratingSum),
          ),
        ),
        horizontalSpace(8),
        Expanded(
          flex: 5,
          child: SlideInLeft(
            from: 400,
            delay: const Duration(milliseconds: 120),
            child: Reviews(reviews: freelancerModel.reviewCount),
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
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(12),
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
