import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

import '../../../../../core/cache/cache_helper.dart';
import '../../../../../core/helpers/extensions.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/app_style.dart';
import '../../../../../core/utils/app_constants.dart';

Future<void> showLogoutDialog(BuildContext context) async {
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