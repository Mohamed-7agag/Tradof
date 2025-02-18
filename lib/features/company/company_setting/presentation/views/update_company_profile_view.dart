import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../../core/utils/widgets/custom_app_bar.dart';
import '../../../company_profile/data/model/company_model.dart';
import '../widgets/build_update_company_profile_view.dart';

class UpdateCompanyProfileView extends StatelessWidget {
  const UpdateCompanyProfileView({required this.companyModel, super.key});
  final CompanyModel companyModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
        title: 'Personal Info',
        actionIcon: HugeIcons.strokeRoundedPencilEdit02,
      ),
      body: BuildUpdateCompanyProfileView(companyModel: companyModel),
    );
  }
}
