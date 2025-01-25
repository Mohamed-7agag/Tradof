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
  static TextStyle robotoBold20 = GoogleFonts.roboto(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle robotoRegular14 = GoogleFonts.roboto(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
  );
  static TextStyle robotoRegular12 = GoogleFonts.roboto(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.regular,
  );
  static TextStyle robotoRegular10 = GoogleFonts.roboto(
    fontSize: 10.sp,
    fontWeight: FontWeightHelper.regular,
  );
  //! Roboto Condensed Font
  static TextStyle robotoCondensedSemiBold36 = GoogleFonts.robotoCondensed(
    fontSize: 36.sp,
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle robotoCondensedSemiBold32 = GoogleFonts.robotoCondensed(
    fontSize: 32.sp,
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
  static TextStyle poppinsSemiBold14 = GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle poppinsMedium22 = GoogleFonts.poppins(
    fontSize: 22.sp,
    fontWeight: FontWeightHelper.bold,
  );

  //! Epilogue Font
  static TextStyle epilogueRegular14 = GoogleFonts.epilogue(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
  );
}
