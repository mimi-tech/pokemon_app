// ignore_for_file: avoid-cubits

/*

I ignored it because, I understood what is required ( converting cubit to bloc), Which will warrant me making multiple changes.
Note: When when building the project. I will avoid cubit completely

 */
import "package:bloc/bloc.dart";
import "package:flutter/material.dart";
import "package:phundit_app/theme/theme_state.dart";

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit(Color initialColor) : super(CurrentThemeState(initialColor));

  void changeThemeColor(Color color) {
    emit(CurrentThemeState(color));
  }
}
