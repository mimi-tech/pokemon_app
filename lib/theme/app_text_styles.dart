import "package:flutter/material.dart";
import "package:mimi_pokemon_app/commons/app_colors.dart";
import "package:mimi_pokemon_app/commons/app_dimes.dart";
import "package:mimi_pokemon_app/gen/fonts.gen.dart";

class AppTextStyles {
  static const primaryFamily = FontFamily.sofiaSans;
  static const secondaryFamily = FontFamily.sofiaSans;

  final kHeadLine1Style = TextStyle(
    color: _fontColor,
    fontSize: AppDimes().kFontSize56,
    fontWeight: FontWeight.w600,
    fontFamily: primaryFamily,
  );

  final kHeadLine2Style = TextStyle(
    color: _fontColor,
    fontSize: AppDimes().kFontSize48,
    fontWeight: FontWeight.w600,
    fontFamily: primaryFamily,
  );

  final kHeadLine4Style = TextStyle(
    color: _fontColor,
    fontSize: AppDimes().kFontSize32,
    fontWeight: FontWeight.w500,
    fontFamily: primaryFamily,
  );

  final kHeadLine5Style = TextStyle(
    color: _fontColor,
    fontSize: AppDimes().kFontSize2116,
    fontWeight: FontWeight.w600,
    fontFamily: primaryFamily,
  );

  final kBodyText1Style = TextStyle(
    color: _fontColor,
    fontSize: AppDimes().kFontSize16,
    fontWeight: FontWeight.w400,
    fontFamily: secondaryFamily,
  );

  final kBodyText2Style = TextStyle(
    color: _fontColor,
    fontSize: AppDimes().kFontSize18,
    fontWeight: FontWeight.w400,
    fontFamily: secondaryFamily,
  );

  final kSubTitle1Style = TextStyle(
    color: _fontColor,
    fontSize: AppDimes().kFontSize19,
    fontWeight: FontWeight.w600,
    fontFamily: primaryFamily,
  );

  final kCardTheme = CardTheme(
    shape: RoundedRectangleBorder(
      side: BorderSide(color: Colors.transparent, width: AppDimes().size1),
      borderRadius: const BorderRadius.all(Radius.circular(20.21)),
    ),
  );
  static const _fontColor = AppColors.kBlackColor;
}
