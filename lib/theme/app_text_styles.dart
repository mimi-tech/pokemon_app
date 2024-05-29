import "package:flutter/material.dart";
import "package:mimi_pokemon_app/commons/app_colors.dart";
import "package:mimi_pokemon_app/commons/app_dimes.dart";
import "package:mimi_pokemon_app/gen/fonts.gen.dart";

class AppTextStyles {
  static const primaryFamily = FontFamily.sofiaSans;
  static const secondaryFamily = FontFamily.sofiaSans;

  final headLine1Style = TextStyle(
    color: _fontColor,
    fontSize: AppDimes().fontSize56,
    fontWeight: FontWeight.w600,
    fontFamily: primaryFamily,
  );

  final headLine2Style = TextStyle(
    color: _fontColor,
    fontSize: AppDimes().fontSize48,
    fontWeight: FontWeight.w600,
    fontFamily: primaryFamily,
  );

  final headLine4Style = TextStyle(
    color: _fontColor,
    fontSize: AppDimes().fontSize32,
    fontWeight: FontWeight.w500,
    fontFamily: primaryFamily,
  );

  final headLine5Style = TextStyle(
    color: _fontColor,
    fontSize: AppDimes().fontSize2116,
    fontWeight: FontWeight.w600,
    fontFamily: primaryFamily,
  );

  final bodyText1Style = TextStyle(
    color: _fontColor,
    fontSize: AppDimes().fontSize16,
    fontWeight: FontWeight.w400,
    fontFamily: secondaryFamily,
  );

  final bodyText2Style = TextStyle(
    color: _fontColor,
    fontSize: AppDimes().fontSize18,
    fontWeight: FontWeight.w400,
    fontFamily: secondaryFamily,
  );

  final subTitle1Style = TextStyle(
    color: _fontColor,
    fontSize: AppDimes().fontSize19,
    fontWeight: FontWeight.w600,
    fontFamily: primaryFamily,
  );

  final cardTheme = CardTheme(
    shape: RoundedRectangleBorder(
      side: BorderSide(color: Colors.transparent, width: AppDimes().size1),
      borderRadius: const BorderRadius.all(Radius.circular(20.21)),
    ),
  );
  static const _fontColor = AppColors.blackColor;
}
