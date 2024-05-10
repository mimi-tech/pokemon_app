import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:phundit_app/theme/theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit(Color initialColor) : super(CurrentThemeState(initialColor));

  void changeThemeColor(Color color) {
    emit(CurrentThemeState(color));
  }
}
