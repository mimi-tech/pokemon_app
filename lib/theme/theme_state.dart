import 'package:flutter/material.dart';

abstract class ThemeState {}

class InitialThemeState extends ThemeState {}

class CurrentThemeState extends ThemeState {
  final Color primaryColor;
  CurrentThemeState(this.primaryColor);
}
