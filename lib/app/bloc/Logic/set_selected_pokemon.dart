import "package:mimi_pokemon_app/app/bloc/Logic/pokemon_details_event.dart";
import "package:mimi_pokemon_app/model/pokemon/pokemon.dart";

class SetSelectedPokemon extends PokemonDetailsEvent {
  const SetSelectedPokemon(this.selectedPokemon);
  final Pokemon selectedPokemon;

  @override
  List<Object> get props => [selectedPokemon];
}
