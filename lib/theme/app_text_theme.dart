import "package:flutter/material.dart";
import "package:mimi_pokemon_app/theme/app_text_styles.dart";

class AppTextTheme {
  final kTextTheme = TextTheme(
    displayLarge: AppTextStyles().headLine1Style,
    displayMedium: AppTextStyles().headLine2Style,
    headlineMedium: AppTextStyles().headLine4Style,
    headlineSmall: AppTextStyles().headLine5Style,
    titleMedium: AppTextStyles().subTitle1Style,
    bodyLarge: AppTextStyles().bodyText1Style,
    bodyMedium: AppTextStyles().bodyText2Style,
  );
}
