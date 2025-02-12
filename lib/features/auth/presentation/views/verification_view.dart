import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tradof/core/helpers/extensions.dart';
import 'package:tradof/core/helpers/spacing.dart';
import 'package:tradof/core/routing/routes.dart';
import 'package:tradof/core/theming/app_colors.dart';
import 'package:tradof/core/theming/app_style.dart';
import 'package:tradof/core/utils/widgets/custom_button.dart';

class VerificationView extends StatelessWidget {
  const VerificationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BounceInDown(
                from: 400,
                child: SvgPicture.asset('assets/images/success.svg')),
            verticalSpace(30),
            Text(
              'Verification\nSuccessful',
              style: AppStyle.poppinsBold22.copyWith(color: AppColors.primary),
              textAlign: TextAlign.center,
            ),
            verticalSpace(14),
            Text(
              'You now have full access to\nour system',
              style: AppStyle.robotoRegular14,
              textAlign: TextAlign.center,
            ),
            verticalSpace(46),
            SlideInUp(
              from: 400,
              child: CustomButton(
                text: "Let’s Start",
                onPressed: () {
                  context.pushNamedAndRemoveUntil(
                    Routes.loginViewRoute,
                    predicate: (route) => false,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
