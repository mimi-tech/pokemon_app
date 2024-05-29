import "package:flutter/material.dart";
import "package:mimi_pokemon_app/commons/app_colors.dart";
import "package:mimi_pokemon_app/commons/app_dimes.dart";
import "package:mimi_pokemon_app/theme/app_text_styles.dart";

class AppTheme {
  static ThemeData lightTheme(Color primaryColor) {
    return ThemeData(
      hintColor: AppColors.hintColor,
      primaryColor: primaryColor,
      fontFamily: AppTextStyles.primaryFamily,
      iconTheme: IconThemeData(size: AppDimes().size25),
      textTheme: TextTheme(
        displayLarge: AppTextStyles().headLine1Style,
        displayMedium: AppTextStyles().headLine2Style,
        headlineMedium: AppTextStyles().headLine4Style,
        headlineSmall: AppTextStyles().headLine5Style,
        titleMedium: AppTextStyles().subTitle1Style,
        bodyLarge: AppTextStyles().bodyText1Style,
        bodyMedium: AppTextStyles().bodyText2Style,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
      ),
      cardTheme: AppTextStyles().cardTheme,
    );
  }
}
