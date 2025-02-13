import 'package:flutter/material.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../data/model/freelancer_model.dart';
import 'freelancer_language_pair.dart';
import 'freelancer_specialization.dart';

class FreelancerProfileTables extends StatelessWidget {
  const FreelancerProfileTables({
    super.key,
    required this.freelancerModel,
  });
  final FreelancerModel freelancerModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FreelancerLanguagePair(
          freelancerModel: freelancerModel,
        ),
        verticalSpace(23),
        FreelancerSpecialization(
          freelancerModel: freelancerModel,
        ),
        // specialiaztion table
      ],
    );
  }
}
