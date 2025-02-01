import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tradof/core/helpers/spacing.dart';
import 'package:tradof/core/theming/app_colors.dart';
import 'package:tradof/features/company/profile_company/data/model/company_model.dart';
import 'package:tradof/features/company/profile_company/presentation/widgets/rating.dart';
import 'package:tradof/features/company/profile_company/presentation/widgets/reviews.dart';

class RatingAndReviews extends StatelessWidget {
  const RatingAndReviews({super.key, required this.companyModel});
  final CompanyModel companyModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          Expanded(
            flex: 6,
            child: Rating(rating: companyModel.ratingSum,),
          ),
          horizontalSpace(8),
          Expanded(
            flex: 5,
            child: Reviews(reviews: companyModel.reviewCount,),
          ),
          horizontalSpace(8),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 14, horizontal: 12),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(12),
              ),
              child: SvgPicture.asset('assets/images/share.svg'),
            ),
          )
        ],
      ),
    );
  }
}
