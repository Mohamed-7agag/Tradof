import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:tradof/core/helpers/spacing.dart';
import 'package:tradof/core/theming/app_colors.dart';
import 'package:tradof/core/theming/app_style.dart';
import 'package:tradof/features/auth/presentation/widgets/account_type_custom.dart';

class SelectAccountTypeSection extends StatelessWidget {
  const SelectAccountTypeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width - 40.w,
      height: 342.w,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(3.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(16),
            Text(
              'Account Type',
              style: AppStyle.robotoCondensedRegular15,
            ),
            verticalSpace(20),
            AccountTypeCustom(
              image: 'assets/images/freelancer_account_icon.svg',
              title: 'Freelancer account',
              description:
                  'if you are doing all jobs alone and do not subcontract freelancers. ',
            ),
            verticalSpace(20),
            AccountTypeCustom(
              image: 'assets/images/company_account_icon.svg',
              title: 'Company account',
              description:
                  'if you are going to assign jobs to in-house translators, freelancers or other companies. the system will have supplier functionality and you will be able to assign jobs to your suppliers.',
            ),
          ],
        ),
      ),
    );
  }
}

