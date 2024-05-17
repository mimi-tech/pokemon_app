import "package:mimi_pokemon_app/app/bloc/Logic/pokemon_list_state.dart";
import "package:mimi_pokemon_app/model/pokemon/pokemon.dart";

class InitialPokemonListState extends PokemonListState {
  InitialPokemonListState();
  final pokemonList = <Pokemon>[];
  final selectedTypes = const <Map<String, dynamic>>[];
}
