import "package:mimi_pokemon_app/app/bloc/Logic/pokemon_details_event.dart";
import "package:mimi_pokemon_app/model/pokemon/pokemon.dart";

class ItemSelected extends PokemonDetailsEvent {
  const ItemSelected(this.fetchedPokemon, this.selectedPokemon);
  final Pokemon selectedPokemon;
  final List<Pokemon> fetchedPokemon;

  @override
  List<Object> get props => [selectedPokemon, fetchedPokemon];
}
