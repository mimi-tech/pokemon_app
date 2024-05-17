import "package:flutter/material.dart";
import "package:mimi_pokemon_app/commons/app_colors.dart";
import "package:mimi_pokemon_app/commons/app_dimes.dart";
import "package:mimi_pokemon_app/theme/app_text_styles.dart";

class AppTheme {
  static ThemeData lightTheme(Color primaryColor) {
    return ThemeData(
      hintColor: AppColors.kHintColor,
      primaryColor: primaryColor,
      fontFamily: AppTextStyles.primaryFamily,
      iconTheme: IconThemeData(size: AppDimes().size25),
      textTheme: TextTheme(
        displayLarge: AppTextStyles().kHeadLine1Style,
        displayMedium: AppTextStyles().kHeadLine2Style,
        headlineMedium: AppTextStyles().kHeadLine4Style,
        headlineSmall: AppTextStyles().kHeadLine5Style,
        titleMedium: AppTextStyles().kSubTitle1Style,
        bodyLarge: AppTextStyles().kBodyText1Style,
        bodyMedium: AppTextStyles().kBodyText2Style,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.kWhiteColor,
        elevation: 0,
      ),
      cardTheme: AppTextStyles().kCardTheme,
    );
  }
}
