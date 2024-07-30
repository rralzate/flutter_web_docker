import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'colors.dart';

/// This textStyle its for all Logo Text in the aplication
TextStyle get textLogoStyle => GoogleFonts.lato(
      color: colorWhite,
      fontSize: Adaptive.sp(17),
      fontWeight: FontWeight.bold,
    );

TextStyle get textMenuItemStyle => GoogleFonts.lato(
      color: colorWhite.withOpacity(0.8),
      fontSize: Adaptive.sp(14),
    );

TextStyle get textTitleStyle => GoogleFonts.lato(
      color: colorWhite,
      fontSize: Adaptive.sp(11),
      fontWeight: FontWeight.bold,
    );

/// This textStyle its for all Text in the aplication
TextStyle textStyleNormal(Color color) => GoogleFonts.lato(
      color: color,
      fontSize: Adaptive.sp(11),
      fontWeight: FontWeight.w600,
    );

TextStyle textStyleInput(Color color) => GoogleFonts.lato(
      color: color,
      fontWeight: FontWeight.w500,
      fontSize: Adaptive.sp(11),
    );

TextStyle textStylePlaceholder(Color color) => GoogleFonts.lato(
      color: color,
      fontWeight: FontWeight.w500,
      fontSize: Adaptive.sp(11),
    );

/// This textStyle its for all white Text in the aplication

TextStyle get textWhiteStyleButton => GoogleFonts.lato(
      color: colorWhite,
      fontWeight: FontWeight.w600,
      fontSize: Adaptive.sp(11),
    );

/// This textStyle its for all white Text in the aplication

TextStyle get textBlackStyleButton => GoogleFonts.lato(
      color: primaryColor,
      fontWeight: FontWeight.w600,
      fontSize: Adaptive.sp(11),
    );

/// This textStyle its for all black Text in the aplication

TextStyle get textBlackStyleTitle => GoogleFonts.lato(
      color: primaryColor,
      fontWeight: FontWeight.w600,
      fontSize: Adaptive.sp(13),
    );

/// This textStyle its for all black Text in the aplication

TextStyle get textBlackStyle => GoogleFonts.lato(
      color: primaryColor,
      fontWeight: FontWeight.normal,
      fontSize: Adaptive.sp(11),
    );

/// This textStyle its for all black Text in the aplication

TextStyle get textBlackStyleLitte => GoogleFonts.lato(
      color: primaryColor,
      fontWeight: FontWeight.normal,
      fontSize: Adaptive.sp(11),
    );

/// This textStyle its for all black Text in the aplication

TextStyle get textBlackStyleBold => GoogleFonts.lato(
      color: primaryColor,
      fontWeight: FontWeight.bold,
      fontSize: Adaptive.sp(11),
    );

/// This textStyle its for all black SubTitle in the aplication

TextStyle get textBlackStyleSubTitle => GoogleFonts.lato(
      color: primaryColor,
      fontWeight: FontWeight.w600,
      fontSize: Adaptive.sp(12),
    );

/// This textStyle its for all white Text in the aplication

TextStyle get textWhiteStyle => GoogleFonts.lato(
      color: colorWhite,
      fontWeight: FontWeight.w600,
      fontSize: Adaptive.sp(11),
    );

TextStyle get textGrayStyleInput => GoogleFonts.lato(
      color: primaryColor,
      fontWeight: FontWeight.w500,
      fontSize: Adaptive.sp(17),
    );

TextStyle get textGrayStylePlaceholder => GoogleFonts.lato(
      color: primaryColor,
      fontWeight: FontWeight.w500,
      fontSize: Adaptive.sp(13),
    );
