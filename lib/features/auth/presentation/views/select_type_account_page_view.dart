import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tradof/core/helpers/spacing.dart';
import 'package:tradof/core/theming/app_colors.dart';
import 'package:tradof/core/theming/app_style.dart';
import 'package:tradof/core/utils/widgets/custom_button.dart';
import 'package:tradof/features/auth/presentation/widgets/create_account_countainer_curve.dart';
import 'package:tradof/features/auth/presentation/widgets/select_account_type_section.dart';

class SelectTypeAccountPageView extends StatelessWidget {
  const SelectTypeAccountPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        CreateAccountContainerCurve(),
        verticalSpace(20),
        Positioned(
          top: 250,
          child: SelectAccountTypeSection(),
        ),
        Positioned(
          bottom: 32.h,
          left: 16.w,
          right: 16.w,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Icon(Icons.check_box_outline_blank, color: AppColors.white),
                    horizontalSpace(8),
                    Text(
                      "I agree to the Terms of Service and Privacy Policy.",
                      style: AppStyle.robotoRegular14.copyWith(
                        fontSize: 10.sp,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
              verticalSpace(60),
              CustomButton(
                text: 'Continue',
                onPressed: () {},
                color: AppColors.lightOrange,
              ),
              verticalSpace(40),
            ],
          ),
        ),
      ],
    );
  }
}
