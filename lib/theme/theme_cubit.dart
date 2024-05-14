// theme_cubit.dart

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:phundit_app/theme/theme_event.dart';
import 'package:phundit_app/theme/theme_state.dart';

// theme_cubit.dart (updated)
class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit(Color initialColor) : super(CurrentThemeState(initialColor));

  void changeThemeColor(Color color) {
    emit(CurrentThemeState(color)); // Emit a Change<ThemeState>
  }

}
