import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'font_weight_helper.dart';

abstract class AppStyle {
  //! Roboto Font
  // Regular weight
  static TextStyle robotoRegular8 = GoogleFonts.roboto(
    fontSize: 8.sp,
    fontWeight: FontWeightHelper.regular,
  );
  static TextStyle robotoRegular10 = GoogleFonts.roboto(
    fontSize: 10.sp,
    fontWeight: FontWeightHelper.regular,
  );
  static TextStyle robotoRegular12 = GoogleFonts.roboto(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.regular,
  );
  static TextStyle robotoRegular14 = GoogleFonts.roboto(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
  );
  static TextStyle robotoRegular15 = GoogleFonts.roboto(
    fontSize: 15.sp,
    fontWeight: FontWeightHelper.regular,
  );

  // Medium weight
  static TextStyle robotoMedium10 = GoogleFonts.roboto(
    fontSize: 10.sp,
    fontWeight: FontWeightHelper.medium,
  );

  // Semi-bold weight
  static TextStyle robotoSemiBold10 = GoogleFonts.roboto(
    fontSize: 10.sp,
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle robotoSemiBold12 = GoogleFonts.roboto(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.semiBold,
  );

  // Bold weight
  static TextStyle robotoBold20 = GoogleFonts.roboto(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle robotoBold22 = GoogleFonts.roboto(
    fontSize: 22.sp,
    fontWeight: FontWeightHelper.bold,
  );

  // Extra-bold and black weights
  static TextStyle robotoExtraBold32 = GoogleFonts.roboto(
    fontSize: 32.sp,
    fontWeight: FontWeightHelper.extraBold,
  );
  static TextStyle robotoBlack15 = GoogleFonts.roboto(
    fontSize: 15.sp,
    fontWeight: FontWeightHelper.black,
  );

  //! Roboto Condensed Font
  // Regular weight
  static TextStyle robotoCondensedRegular8 = GoogleFonts.robotoCondensed(
    fontSize: 8.sp,
    fontWeight: FontWeightHelper.regular,
  );
  static TextStyle robotoCondensedRegular12 = GoogleFonts.robotoCondensed(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.regular,
  );
  static TextStyle robotoCondensedRegular15 = GoogleFonts.robotoCondensed(
    fontSize: 15.sp,
    fontWeight: FontWeightHelper.regular,
  );

  // Medium weight
  static TextStyle robotoCondensedMedium12 = GoogleFonts.robotoCondensed(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle robotoCondensedMedium15 = GoogleFonts.robotoCondensed(
    fontSize: 15.sp,
    fontWeight: FontWeightHelper.medium,
  );

  // Semi-bold weight
  static TextStyle robotoCondensedSemiBold20 = GoogleFonts.robotoCondensed(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle robotoCondensedSemiBold32 = GoogleFonts.robotoCondensed(
    fontSize: 32.sp,
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle robotoCondensedSemiBold36 = GoogleFonts.robotoCondensed(
    fontSize: 36.sp,
    fontWeight: FontWeightHelper.semiBold,
  );

  // Bold weight
  static TextStyle robotoCondensedBold14 = GoogleFonts.robotoCondensed(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle robotoCondensedBold50 = GoogleFonts.robotoCondensed(
    fontSize: 50.sp,
    fontWeight: FontWeightHelper.bold,
  );

  //! Poppins Font
  static TextStyle poppinsMedium14 = GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle poppinsMedium15 = GoogleFonts.poppins(
    fontSize: 15.sp,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle poppinsSemiBold14 = GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle poppinsBold22 = GoogleFonts.poppins(
    fontSize: 22.sp,
    fontWeight: FontWeightHelper.bold,
  );

  //! Epilogue Font
  static TextStyle epilogueRegular14 = GoogleFonts.epilogue(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
  );
}
