import "package:mimi_pokemon_app/model/pokemon/pokemon.dart";
import "package:mimi_pokemon_app/model/pokemonnModel/pokemon_model.dart";
import "package:mimi_pokemon_app/services/the_failure.dart";
import "package:multiple_result/multiple_result.dart";

abstract class PokemonService {
  Future<Result<List<PokemonModel>, TheFailure>> fetchPokemon();
  Future<Result<Pokemon, TheFailure>> fetchPokemonDetails(String url);
  Future<String> fetchSvgString(String svgUrl);
}
