import 'package:flutter/material.dart';
import 'package:phundit_app/commons/color.dart';
import 'package:phundit_app/theme/text_styles.dart';

class MyTheme {
  static ThemeData  lightTheme(Color primaryColor) {
    return ThemeData(
        primaryColor: primaryColor,
        // scaffoldBackgroundColor: kWhiteColor,
        //
        // colorScheme: ThemeData().colorScheme.copyWith(
        //   primary: kWhiteColor,
        //   secondary: primaryColor,
        // ),
        appBarTheme:  const AppBarTheme(
            elevation: 0,
            backgroundColor: kWhiteColor,

        ),
        fontFamily: primaryFamily,

        textTheme:  TextTheme(
          displayLarge: kHeadLine1Style,
          displayMedium: kHeadLine2Style,
          headlineMedium: kHeadLine4Style,
          headlineSmall: kHeadLine5Style,
          bodyLarge: kBodyText1Style,
          bodyMedium: kBodyText2Style,
          titleMedium: kSubTitle1Style,

        ),
        cardTheme: kCardTheme,

        hintColor: kHintColor,
        // dialogBackgroundColor: Colors.blue,

        iconTheme: const IconThemeData(size: 25),

    );
  }
}
