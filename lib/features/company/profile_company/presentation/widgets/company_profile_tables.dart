import 'package:flutter/material.dart';
import 'package:tradof/features/company/profile_company/data/model/company_model.dart';

import '../../../../../core/helpers/spacing.dart';
import 'industries_served.dart';
import 'preferred_language.dart';

class CompanyProfileTables extends StatelessWidget {
  const CompanyProfileTables({super.key, required this.companyModel});
  final CompanyModel companyModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PreferredLanguage(
          companyModel: companyModel,
        ),
        verticalSpace(23),
        IndustriesServed(
          companyModel: companyModel,
        ),
        verticalSpace(30),
      ],
    );
  }
}
