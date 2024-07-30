import 'colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// SchemeColors
const colorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: primaryColor,
  onPrimary: primaryColor,
  secondary: secondColor,
  onSecondary: secondColor,
  error: secondColor,
  onError: secondColor,
  surface: colorWhite,
  onSurface: mainGrey,
);

const bottomNavigationBarTheme = BottomNavigationBarThemeData(
  backgroundColor: colorWhite,
  elevation: 0,
);

const cupertinoOverrideTheme = CupertinoThemeData(
  primaryColor: primaryColor,
  textTheme: CupertinoTextThemeData(
    textStyle: TextStyle(letterSpacing: 0),
  ),
);

const appBarTheme = AppBarTheme(
  backgroundColor: colorWhite,
  elevation: 0,
  centerTitle: true,
);

final inputDecorationTheme = InputDecorationTheme(
  //filled: true,
  suffixIconColor: filledHintStyleColor,
  //fillColor: colorWhite.withOpacity(0.4),
  border: OutlineInputBorder(
    borderSide: const BorderSide(color: filledHintStyleColor, width: 0.5),
    borderRadius: BorderRadius.circular(10.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: filledHintStyleColor, width: 0.5),
    borderRadius: BorderRadius.circular(10.0),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: filledHintStyleColor, width: 0.5),
    borderRadius: BorderRadius.circular(10.0),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: secondColor, width: 0.5),
    borderRadius: BorderRadius.circular(10.0),
  ),
  hintStyle: const TextStyle(
    color: darkGrey,
    fontWeight: FontWeight.bold,
  ),
  errorStyle: const TextStyle(
    color: secondColor,
    fontWeight: FontWeight.bold,
  ),
);

final appTheme = ThemeData(
  primaryColor: primaryColor,
  scaffoldBackgroundColor: scaffold,
  textTheme: GoogleFonts.assistantTextTheme(GoogleFonts.latoTextTheme()),
  cupertinoOverrideTheme: cupertinoOverrideTheme,
  bottomNavigationBarTheme: bottomNavigationBarTheme,
  appBarTheme: appBarTheme,
  inputDecorationTheme: inputDecorationTheme,
  colorScheme: colorScheme.copyWith(error: secondColor),
);
