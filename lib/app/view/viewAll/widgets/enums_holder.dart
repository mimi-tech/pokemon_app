import 'package:phundit_app/model/pokemon/pokemon.dart';

class EnumsHolder {
 static List<Pokemon> fetchedPokemon = [];
  static Pokemon selectedPokemon = Pokemon();
  static const fire = 'fire';
  static const flying = 'flying';
  static const normal = 'normal';
  static const bug = 'bug';
  static const grass = 'grass';
  static const poison = 'poison';

  static const fireLogo = '🔥';
  static const flyingLogo = '🦋';
  static const normalLogo = '🐻';
  static const bugLogo = '🐞';
  static const grassLogo = '🌿';
  static const poisonLogo = '☠️';

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
