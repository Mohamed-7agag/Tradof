import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tradof/core/helpers/spacing.dart';
import 'package:tradof/core/theming/app_colors.dart';
import 'package:tradof/core/theming/app_style.dart';
import 'package:tradof/core/utils/widgets/custom_button.dart';

class VerificationPageView extends StatelessWidget {
  const VerificationPageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/success.svg',
            ),
            verticalSpace(31),
            Text(
              'Verification\n Successful',
              style: AppStyle.poppinsBold22.copyWith(color: AppColors.primary),
            ),
            verticalSpace(13),
            Text(
              'You now have full access to\n our system',
              style: AppStyle.robotoRegular14.copyWith(color: AppColors.black),
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
            verticalSpace(43),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.sp),
              child: CustomButton(
                text: "Let’s Start",
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
