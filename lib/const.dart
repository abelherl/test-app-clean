import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final deviceSize = (BuildContext context) => MediaQuery.of(context).size;

const aFontFamily = 'Poppins';

const Color aBackgroundColor = const Color(0xFFF7F9FC);
const Color aDarkTextColor = const Color(0xFF222C45);
const Color aLightTextColor = const Color(0xFF929EB5);
const Color aInactiveColor = const Color(0xFFEDF1F7);
const Color aShadowColor = const Color(0xFFBBBBBB);
const Color aBorderColor = const Color(0xFFDDDDDD);

const Color aRed = const Color(0xFFD63B31);
const Color aLightRed = const Color(0xFFFCF0EF);
const Color aGreen = const Color(0xFF28AF47);
const Color aLightGreen = const Color(0xFFD8FBD3);

const aTitleStyle = TextStyle(
  color: aDarkTextColor,
  fontFamily: aFontFamily,
  fontWeight: FontWeight.w500,
  decoration: TextDecoration.none,
);

const aBodyStyle = TextStyle(
  color: aDarkTextColor,
  fontFamily: aFontFamily,
  fontWeight: FontWeight.w400,
  decoration: TextDecoration.none,
  fontSize: 14,
);

const aBodyLightStyle = TextStyle(
  color: aLightTextColor,
  fontFamily: aFontFamily,
  fontWeight: FontWeight.w400,
  decoration: TextDecoration.none,
  fontSize: 14,
);

const aErrorStyle = TextStyle(
  color: aRed,
  fontFamily: aFontFamily,
  fontWeight: FontWeight.w400,
  decoration: TextDecoration.none,
  fontSize: 14,
);

const aHeader2Style = TextStyle(
  color: aDarkTextColor,
  fontFamily: aFontFamily,
  fontWeight: FontWeight.w500,
  fontSize: 23,
  decoration: TextDecoration.none,
);

const aHeader3Style = TextStyle(
  color: aDarkTextColor,
  fontFamily: aFontFamily,
  fontWeight: FontWeight.w500,
  fontSize: 20,
  decoration: TextDecoration.none,
);

const aHeader4Style = TextStyle(
  color: aDarkTextColor,
  fontFamily: aFontFamily,
  fontWeight: FontWeight.w500,
  fontSize: 16,
  height: 1,
  decoration: TextDecoration.none,
);

const aHeader5Style = TextStyle(
  color: aDarkTextColor,
  fontFamily: aFontFamily,
  fontWeight: FontWeight.w500,
  fontSize: 14,
  decoration: TextDecoration.none,
);

const aBorderWidth = 1.0;
const aBorderRadius = 10.0;
const aPadding = 15.0;
const aStandardWidth = 350.0;

final aFormatter = NumberFormat("#,###");