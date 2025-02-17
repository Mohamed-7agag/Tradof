import 'package:flutter/material.dart';
import 'package:tradof/features/company/company_profile/data/model/company_model.dart';

import '../../../../../core/helpers/spacing.dart';
import 'industries_served.dart';
import 'preferred_language.dart';

class CompanyProfileTables extends StatelessWidget {
  const CompanyProfileTables({required this.companyModel, super.key});
  final CompanyModel companyModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PreferredLanguage(
          companyModel: companyModel,
        ),
        verticalSpace(25),
        IndustriesServed(
          companyModel: companyModel,
        ),
      ],
    );
  }
}
