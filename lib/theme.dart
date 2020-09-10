import 'package:flutter/material.dart';
import 'const.dart';

ThemeData mainTheme() {
  final fontFamily = aFontFamily;
  final accentColor = aRed;
  final primaryColor = aRed;

  TextTheme _basicTextTheme(TextTheme base) {
    return base.copyWith(
      headline5: base.headline5.copyWith(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w700,
        fontSize: 16,
        color: Colors.black87
      ),
      subtitle1: base.subtitle1.copyWith(
        fontFamily: fontFamily,
        fontSize: 13,
        color: Colors.black38
      )
    );
  }

  final ThemeData base = ThemeData.light();

  return base.copyWith(
    textTheme: _basicTextTheme(base.textTheme),
    primaryColor: primaryColor,
    backgroundColor: Colors.white,
    accentColor: accentColor
  );
}