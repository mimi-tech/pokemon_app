import "package:mimi_pokemon_app/app/bloc/Logic/pokemon_details_event.dart";
import "package:mimi_pokemon_app/model/pokemonnModel/pokemon_model.dart";

class FetchPokemon extends PokemonDetailsEvent {
  const FetchPokemon(this.end, this.pokemonData, this.start);
  final int end;
  final List<PokemonModel> pokemonData;
  final int start;

  @override
  List<Object> get props => [end, pokemonData, start];
}
