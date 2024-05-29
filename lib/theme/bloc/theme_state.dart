part of "theme_bloc.dart";

@freezed
class ThemeState with _$ThemeState {
  const factory ThemeState.initialThemeState() = InitialThemeState;
  const factory ThemeState.currentThemeState(Color primaryColor) =
      CurrentThemeState;
}
