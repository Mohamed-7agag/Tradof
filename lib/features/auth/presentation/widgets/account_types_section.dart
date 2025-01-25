import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';
import 'account_type_custom.dart';

class AccountTypesSection extends StatefulWidget {
  const AccountTypesSection({super.key});

  @override
  State<AccountTypesSection> createState() => _AccountTypesSectionState();
}

class _AccountTypesSectionState extends State<AccountTypesSection> {
  int _selectedAccountType = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AccountTypeCustom(
          onTap: () {
            setState(() {
              _selectedAccountType = 0;
            });
          },
          image: _selectedAccountType == 0
              ? 'assets/images/company_account_icon.svg'
              : 'assets/images/freelancer_account_icon.svg',
          title: 'Freelancer account',
          description:
              'if you are doing all jobs alone and do not subcontract freelancers. ',
        ),
        verticalSpace(18),
        AccountTypeCustom(
          onTap: () {
            setState(() {
              _selectedAccountType = 1;
            });
          },
          image: _selectedAccountType == 1
              ? 'assets/images/company_account_icon.svg'
              : 'assets/images/freelancer_account_icon.svg',
          title: 'Company account',
          description:
              'if you are going to assign jobs to in-house translators, freelancers or other companies. the system will have supplier functionality and you will be able to assign jobs to your suppliers.',
        ),
      ],
    );
  }
}
