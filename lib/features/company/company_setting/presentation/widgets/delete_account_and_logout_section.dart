import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tradof/core/cache/cache_helper.dart';
import 'package:tradof/core/helpers/extensions.dart';
import 'package:tradof/core/routing/routes.dart';
import 'package:tradof/core/utils/app_constants.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_style.dart';

class DeleteAccountAndLogoutSection extends StatelessWidget {
  const DeleteAccountAndLogoutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: SlideInLeft(
            from: 400,
            delay: Duration(milliseconds: 550),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 16.w)
                  .copyWith(right: 20.w),
              decoration: BoxDecoration(
                color: AppColors.cardColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Delete Account',
                    style: AppStyle.robotoCondensedMedium15.copyWith(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SvgPicture.asset('assets/images/delete_account.svg'),
                ],
              ),
            ),
          ),
        ),
        horizontalSpace(8),
        Expanded(
          flex: 4,
          child: SlideInRight(
            from: 400,
            delay: Duration(milliseconds: 550),
            child: InkWell(
              onTap: () {
                CacheHelper.clearAllSecuredData();
                CacheHelper.removeData(key: AppConstants.role);
                context.goNamed(Routes.loginViewRoute);
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 16.w)
                    .copyWith(right: 20.w),
                decoration: BoxDecoration(
                  color: AppColors.cardColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Logout',
                      style: AppStyle.robotoCondensedMedium15.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SvgPicture.asset('assets/images/logout.svg'),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
