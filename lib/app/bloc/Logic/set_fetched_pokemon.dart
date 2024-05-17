import "package:mimi_pokemon_app/app/bloc/Logic/pokemon_details_event.dart";
import "package:mimi_pokemon_app/model/pokemon/pokemon.dart";

class SetFetchedPokemon extends PokemonDetailsEvent {
  const SetFetchedPokemon(this.fetchedPokemon);
  final List<Pokemon> fetchedPokemon;

  @override
  List<Object> get props => [fetchedPokemon];
}
