
import 'package:phundit_app/model/pokemon/pokemon.dart';

List<Pokemon> fetchedPokemons = [];
Pokemon ? selectedPokemon;
 const String fire = 'fire';
const String flying = 'flying';
const String normal = 'normal';
const String bug = 'bug';
const String grass = 'grass';
const String poison = 'poison';

 String getTypeString(String value) {
   switch (value.toLowerCase()) {
     case fire:
       return '🔥';
     case bug:
       return '🐞';

     case normal:
       return '🐻';

     case poison:
       return '☠️';

     case grass:
       return '🌿';

     case flying:
       return '🦋';
     default:
       return '🔥';
   }
 }
