import "package:mimi_pokemon_app/app/bloc/Logic/pokemon_details_state.dart";
import "package:mimi_pokemon_app/model/pokemon/pokemon.dart";

class PokemonLoadSuccess extends PokemonDetailsState {
  const PokemonLoadSuccess({this.fetchedPokemon, this.selectedPokemon});
  final List<Pokemon>? fetchedPokemon;
  final Pokemon? selectedPokemon;

  @override
  List<Object> get props =>
      [fetchedPokemon ?? [], selectedPokemon ?? Pokemon()];
}
