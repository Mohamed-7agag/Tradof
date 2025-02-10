import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theming/app_style.dart';

Future<bool> exitDialog(BuildContext context) async {
  bool? exitApp = await AwesomeDialog(
          context: context,
          dialogType: DialogType.question,
          animType: AnimType.rightSlide,
          body: Text(
            'Are you sure you want to Exit ?',
            textAlign: TextAlign.center,
            style: AppStyle.robotoRegular14.copyWith(height: 1.8),
          ),
          btnCancelOnPress: () {},
          btnOkOnPress: () {
            SystemNavigator.pop();
          },
          btnOkText: 'Yes',
          btnCancelText: 'No')
      .show();
  return exitApp ?? false;
}
