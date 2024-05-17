import "package:mimi_pokemon_app/app/bloc/Logic/pokemon_details_state.dart";

class PokemonError extends PokemonDetailsState {
  const PokemonError(this.error);
  final String error;
  @override
  List<Object> get props => [error];
}
