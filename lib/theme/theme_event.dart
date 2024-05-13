import "package:flutter/material.dart";

abstract class ThemeEvent {}

class ChangeThemeColor extends ThemeEvent {
  ChangeThemeColor(this.color);
  final Color color;
}
