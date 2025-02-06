import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tradof/core/helpers/spacing.dart';
import 'package:tradof/core/theming/app_colors.dart';

import '../../data/model/company_model.dart';
import 'rating.dart';
import 'reviews.dart';

class RatingAndReviews extends StatelessWidget {
  const RatingAndReviews({super.key, required this.companyModel});
  final CompanyModel companyModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 6,
          child: SlideInLeft(
            from: 400,
            child: Rating(rating: companyModel.ratingSum),
          ),
        ),
        horizontalSpace(8),
        Expanded(
          flex: 5,
          child: SlideInLeft(
            from: 400,
            delay: Duration(milliseconds: 160),
            child: Reviews(reviews: companyModel.reviewCount),
          ),
        ),
        horizontalSpace(8),
        Expanded(
          flex: 2,
          child: SlideInRight(
            from: 400,
            delay: Duration(milliseconds: 320),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 14, horizontal: 12),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(12),
              ),
              child: SvgPicture.asset('assets/images/share.svg'),
            ),
          ),
        )
      ],
    );
  }
}
