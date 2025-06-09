import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_style.dart';

class RatingBarSection extends StatelessWidget {
  const RatingBarSection({
    required this.onRatingUpdate,
    this.isFreelancer = true,
    this.ignoreGestures = false,
    super.key,
   this.initialRating=3 ,
  });

  final bool isFreelancer;
  final void Function(double rating) onRatingUpdate;
  final bool ignoreGestures;
  final double initialRating;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'You can add rate for ${!isFreelancer ? 'Freelancer' : 'Company'}',
            style: AppStyle.poppinsMedium15,
          ),
          verticalSpace(20),
          RatingBar.builder(
            initialRating: initialRating,
            minRating: 1,
            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (__, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: onRatingUpdate,
            ignoreGestures: ignoreGestures,
          ),
          verticalSpace(35),
          Text(
            'Please share with us your opinion about your\ndealings with the ${!isFreelancer ? 'freelancer' : 'company'}.',
            style: AppStyle.robotoRegular12.copyWith(
                color: Colors.grey, fontStyle: FontStyle.italic, height: 1.7),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
