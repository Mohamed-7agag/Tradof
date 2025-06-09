import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../theming/app_colors.dart';
import '../theming/app_style.dart';

Future<void> customUrlLauncher(context, String url) async {
  if (url != "") {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      AwesomeDialog(
        context: context,
        animType: AnimType.rightSlide,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        dialogType: DialogType.error,
        body: Text(
          'This link is not available',
          textAlign: TextAlign.center,
          style: AppStyle.robotoRegular14.copyWith(height: 1.8),
        ),
        dialogBackgroundColor: AppColors.cardColor,
        btnOkOnPress: () {},
      ).show();
    }
  }
}
