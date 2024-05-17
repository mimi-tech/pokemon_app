import "package:mimi_pokemon_app/app/bloc/Logic/pokemon_details_state.dart";
import "package:mimi_pokemon_app/model/pokemon/pokemon.dart";

class PokemonLoaded extends PokemonDetailsState {
  const PokemonLoaded(this.pokemon, this.pokemonData);
  final List<Pokemon> pokemon;
  final Pokemon pokemonData;
  @override
  List<Object> get props => [pokemon, pokemonData];
}
