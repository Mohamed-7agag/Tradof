import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tradof/core/helpers/spacing.dart';
import 'package:tradof/core/theming/app_colors.dart';
import 'package:tradof/core/theming/app_style.dart';
import 'package:tradof/features/auth/presentation/widgets/account_types_section.dart';

class SelectAccountTypeSection extends StatelessWidget {
  const SelectAccountTypeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width - 40.w,
      height: 350.w,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(16),
            Text(
              'Account Type',
              style: AppStyle.robotoCondensedRegular15
                  .copyWith(color: AppColors.darkGrey),
            ),
            verticalSpace(22),
            AccountTypesSection()
          ],
        ),
      ),
    );
  }
}
