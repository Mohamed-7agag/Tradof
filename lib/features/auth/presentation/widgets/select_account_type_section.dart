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
      padding: EdgeInsets.symmetric(vertical: 16.h,horizontal: 16.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Account Type',
            style: AppStyle.robotoCondensedRegular15
                .copyWith(color: AppColors.darkGrey),
          ),
          verticalSpace(22),
          AccountTypesSection()
        ],
      ),
    );
  }
}
