import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'font_weight_helper.dart';

abstract class AppStyle {
  //! Roboto Font
  static TextStyle robotoExtraBold32 = GoogleFonts.roboto(
    fontSize: 32.sp,
    fontWeight: FontWeightHelper.extraBold,
  );
  //! Roboto Condensed Font
  static TextStyle robotoCondensedSemiBold36 = GoogleFonts.robotoCondensed(
    fontSize: 36.sp,
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle robotoCondensedBold50 = GoogleFonts.robotoCondensed(
    fontSize: 50.sp,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle robotoCondensedRegular8 = GoogleFonts.robotoCondensed(
    fontSize: 8.sp,
    fontWeight: FontWeightHelper.regular,
  );
  static TextStyle robotoCondensedRegular15 = GoogleFonts.robotoCondensed(
    fontSize: 15.sp,
    fontWeight: FontWeightHelper.regular,
  );
  //! Poppins Font
  static TextStyle poppinsMedium14 = GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.medium,
  );
}
