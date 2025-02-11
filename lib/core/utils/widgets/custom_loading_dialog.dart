import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

import 'custom_loading_widget.dart';

loadingDialog(BuildContext context, {Color? dialogBackgroundColor}) {
  return AwesomeDialog(
    context: context,
    animType: AnimType.rightSlide,
    body: CustomLoadingWidget(),
    dialogType: DialogType.noHeader,
    dialogBorderRadius: BorderRadius.circular(16),
    width: 180,
    padding: EdgeInsets.symmetric(vertical: 20),
    dialogBackgroundColor: dialogBackgroundColor,
    dismissOnTouchOutside: false,
    dismissOnBackKeyPress: false,
    bodyHeaderDistance: 0,
  ).show();
}
