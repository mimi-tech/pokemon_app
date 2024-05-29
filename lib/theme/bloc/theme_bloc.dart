// ignore_for_file: avoid-bloc-public-methods
import "package:bloc/bloc.dart";
import "package:flutter/material.dart";
import "package:freezed_annotation/freezed_annotation.dart";

part "theme_bloc.freezed.dart";
part "theme_event.dart";
part "theme_state.dart";

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc(Color initialColor) : super(CurrentThemeState(initialColor));

  Stream<ThemeState> mapEventToState(ThemeEvent event) async* {
    if (event is ChangeThemeColor) {
      yield CurrentThemeState(event.color);
    }
  }
}
