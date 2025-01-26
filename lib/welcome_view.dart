import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tradof/core/helpers/spacing.dart';
import 'package:tradof/core/routing/routes.dart';
import 'package:tradof/core/theming/app_colors.dart';
import 'package:tradof/core/theming/app_style.dart';
import 'package:animate_do/animate_do.dart';
class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(flex: 3),
          BounceInDown(
            from: 400,
            child: SvgPicture.asset('assets/images/icon.svg', width: 100.w)),
          verticalSpace(20),
          Text(
            'TRADOF',
            style:
                AppStyle.robotoCondensedBold50.copyWith(color: AppColors.white),
          ),
          verticalSpace(5),
          Text(
            ' Your Trusted Partner in Language Translation',
            style: AppStyle.robotoCondensedRegular15
                .copyWith(color: AppColors.white),
          ),
          verticalSpace(50),
          SlideInLeft(
            from: 400,
            child: IconButton(
              onPressed: () {
                context.pushReplacementNamed(Routes.loginViewRoute);
              },
              icon: Icon(
                Icons.arrow_forward_ios_rounded,
                color: AppColors.primary,
                size: 30.sp,
              ),
              style: IconButton.styleFrom(
                backgroundColor: AppColors.white,
                padding: EdgeInsets.all(15),
                shape: CircleBorder(),
              ),
            ),
          ),
          Spacer(),
          Image.asset('assets/images/splash_bottom.png'),
        ],
      ),
    );
  }
}
