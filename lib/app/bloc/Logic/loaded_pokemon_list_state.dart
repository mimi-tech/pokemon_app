import "package:mimi_pokemon_app/app/bloc/Logic/pokemon_list_state.dart";
import "package:mimi_pokemon_app/model/pokemon/pokemon.dart";
import "package:mimi_pokemon_app/model/type/types.dart";

class LoadedPokemonListState extends PokemonListState {
  const LoadedPokemonListState(this.pokemonList, this.selectedTypes);
  final List<Pokemon> pokemonList;
  final List<Types> selectedTypes;
  @override
  List<Object> get props => [pokemonList, selectedTypes];
}
