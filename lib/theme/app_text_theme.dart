import "package:flutter/material.dart";
import "package:phundit_app/theme/app_text_styles.dart";

class AppTextTheme {
  final kTextTheme = TextTheme(
    displayLarge: AppTextStyles().kHeadLine1Style,
    displayMedium: AppTextStyles().kHeadLine2Style,
    headlineMedium: AppTextStyles().kHeadLine4Style,
    headlineSmall: AppTextStyles().kHeadLine5Style,
    titleMedium: AppTextStyles().kSubTitle1Style,
    bodyLarge: AppTextStyles().kBodyText1Style,
    bodyMedium: AppTextStyles().kBodyText2Style,
  );
}
