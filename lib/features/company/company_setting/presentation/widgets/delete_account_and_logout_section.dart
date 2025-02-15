import 'package:animate_do/animate_do.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:tradof/core/helpers/extensions.dart';

import '../../../../../core/cache/cache_helper.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_style.dart';
import '../../../../../core/utils/app_constants.dart';

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
            delay: Duration(milliseconds: 480),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 16.w),
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
                  HugeIcon(
                    icon: HugeIcons.strokeRoundedDelete02,
                    color: Colors.red,
                  ),
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
            delay: Duration(milliseconds: 480),
            child: InkWell(
              onTap: () {
                _showLogoutDialog(context);
              },
              borderRadius: BorderRadius.circular(15),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 16.w),
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
                    HugeIcon(
                      icon: HugeIcons.strokeRoundedLogout01,
                      color: AppColors.primary,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _showLogoutDialog(BuildContext context) async {
    AwesomeDialog(
      context: context,
      animType: AnimType.rightSlide,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      dialogType: DialogType.question,
      body: Text(
        'Are you sure you want to logout ?',
        textAlign: TextAlign.center,
        style: AppStyle.robotoRegular14.copyWith(height: 1.8),
      ),
      btnCancelOnPress: () {},
      btnOkOnPress: () {
        CacheHelper.clearAllSecuredData();
        CacheHelper.removeData(key: AppConstants.role);
        context.pushNamedAndRemoveUntil(
          Routes.loginViewRoute,
          predicate: (route) => false,
        );
      },
    ).show();
  }
}
