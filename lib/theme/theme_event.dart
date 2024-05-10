import 'package:flutter/material.dart';

abstract class ThemeEvent {}

class ChangeThemeColor extends ThemeEvent {
  final Color color;
  ChangeThemeColor(this.color);
}
