import 'package:flutter/material.dart';
import 'package:my_story/src/themes/color.dart';

ThemeData appThemeData() {
  return ThemeData(
    backgroundColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Sora',
    primaryColor: primaryColor,
    accentColor: violetColor,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: primaryColor,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
    ),
  );
}
