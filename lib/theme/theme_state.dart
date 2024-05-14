import 'package:flutter/material.dart';

abstract class ThemeState {}

class InitialThemeState extends ThemeState {}

class CurrentThemeState extends ThemeState {

  CurrentThemeState(this.primaryColor);
  final Color primaryColor;
}
