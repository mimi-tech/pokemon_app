import "package:flutter/material.dart";
import "package:mimi_pokemon_app/theme/theme_event.dart";

class ChangeThemeColor extends ThemeEvent {
  ChangeThemeColor(this.color);
  final Color color;
}
