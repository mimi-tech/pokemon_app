import "package:mimi_pokemon_app/app/bloc/Logic/pokemon_details_state.dart";

class ErrorPokemonListState extends PokemonDetailsState {
  const ErrorPokemonListState(this.error);
  final String error;
  @override
  List<Object> get props => [error];
}
