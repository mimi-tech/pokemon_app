// ignore_for_file: avoid-bloc-public-methods

import "package:bloc/bloc.dart";
import "package:flutter/material.dart";
import "package:mimi_pokemon_app/theme/change_theme_color.dart";
import "package:mimi_pokemon_app/theme/current_theme_state.dart";
import "package:mimi_pokemon_app/theme/theme_event.dart";
import "package:mimi_pokemon_app/theme/theme_state.dart";

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc(Color initialColor) : super(CurrentThemeState(initialColor));

  Stream<ThemeState> mapEventToState(ThemeEvent event) async* {
    if (event is ChangeThemeColor) {
      yield CurrentThemeState(event.color);
    }
  }
}
