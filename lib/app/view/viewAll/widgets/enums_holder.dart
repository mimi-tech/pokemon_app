// ignore_for_file: avoid-global-state, avoid-non-ascii-symbols, no-equal-switch-case
/*
avoid-global-state: This warning is triggered because you're using
static variables (fetchedPokemon and selectedPokemon) to store global state within the class:
The right thing to do is BLoC to manage these values more efficiently.
This would allow for better separation of concerns and easier state updates throughout your app.
I ignored it because, I understood what is required, Which will warrant me making multiple changes. But when building the project. I will obey the rule


Non-ASCII Symbols: I will need the symbols to come as a image. But I don't think it's available now.

 */
import "package:phundit_app/model/pokemon/pokemon.dart";

class EnumsHolder {
  const EnumsHolder();

  static List<Pokemon> fetchedPokemon = [];
  static Pokemon selectedPokemon = Pokemon();
  static const fire = "fire";
  static const flying = "flying";
  static const normal = "normal";
  static const bug = "bug";
  static const grass = "grass";
  static const poison = "poison";

  static const fireLogo = "🔥";
  static const flyingLogo = "🦋";
  static const normalLogo = "🐻";
  static const bugLogo = "🐞";
  static const grassLogo = "🌿";
  static const poisonLogo = "☠️";

  String getTypeString(String value) {
    switch (value.toLowerCase()) {
      case fire:
        return fireLogo;

      case bug:
        return bugLogo;

      case normal:
        return normalLogo;

      case poison:
        return poisonLogo;

      case grass:
        return grassLogo;

      case flying:
        return flyingLogo;

      default:
        return fireLogo;
    }
  }
}
