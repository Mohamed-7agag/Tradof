import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_style.dart';

class AuthShape extends StatelessWidget {
  const AuthShape({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset('assets/images/auth_shape.svg', width: 1.sw),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/icon.svg',
              width: 70.w,
            ),
            horizontalSpace(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'TRADOF',
                  style: AppStyle.robotoCondensedSemiBold36
                      .copyWith(color: AppColors.white),
                ),
                Text(
                  ' Your Trusted Partner in Language Translation',
                  style: AppStyle.robotoCondensedRegular8
                      .copyWith(color: AppColors.white),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
