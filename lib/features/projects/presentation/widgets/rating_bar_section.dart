import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_style.dart';

class RatingBarSection extends StatelessWidget {
  const RatingBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'You can add rate for Freelancer',
          style: AppStyle.poppinsMedium15,
        ),
        verticalSpace(20),
        RatingBar.builder(
          initialRating: 3,
          minRating: 1,
          allowHalfRating: true,
          itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (__, _) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (value) {},
        ),
        verticalSpace(35),
        Text(
          'Please share with us your opinion about your\ndealings with the freelancer.',
          style: AppStyle.robotoRegular12.copyWith(
              color: Colors.grey, fontStyle: FontStyle.italic, height: 1.7),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
