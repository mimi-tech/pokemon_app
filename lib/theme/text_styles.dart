import 'package:flutter/material.dart';
import 'package:phundit_app/commons/color.dart';
import 'package:phundit_app/commons/dimes.dart';
import 'package:phundit_app/gen/fonts.gen.dart';


const _fontColor = kBlackColor;
const primaryFamily = FontFamily.sofiaSans;
const secondaryFamily = FontFamily.sofiaSans;

final kHeadLine1Style = TextStyle(
  fontSize: kFontSize56,
  fontWeight: FontWeight.w600,
  color: _fontColor,
  fontFamily:primaryFamily,
);

final kHeadLine2Style = TextStyle(
  fontSize: kFontSize48,
  fontWeight: FontWeight.w600,
  color: _fontColor,
  fontFamily:primaryFamily,
);

final kHeadLine4Style = TextStyle(
  fontSize: kFontSize32,
  fontWeight: FontWeight.w500,
  color: _fontColor,
  fontFamily:primaryFamily,
);

final kHeadLine5Style = TextStyle(
  fontSize: kFontSize2116,
  fontWeight: FontWeight.w600,
  color: _fontColor,
  fontFamily:primaryFamily,
);



final kBodyText1Style = TextStyle(
  fontSize: kFontSize16,
  fontWeight: FontWeight.w400,
  color: _fontColor,
  fontFamily:secondaryFamily,

);

final kBodyText2Style = TextStyle(
  fontSize: kFontSize18,
  fontWeight: FontWeight.w400,
  color: _fontColor,
  fontFamily:secondaryFamily,
);

/// Also used for [navTitleTextStyle] CupertinoTextThemeData
final kSubTitle1Style = TextStyle(
  fontSize: kFontSize19,
  fontWeight: FontWeight.w600,
  color: _fontColor,
  fontFamily:primaryFamily,
);

final kCardTheme =  CardTheme(
    shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.transparent, width: 1.0),
        borderRadius:  BorderRadius.circular(20.21),

    )
);