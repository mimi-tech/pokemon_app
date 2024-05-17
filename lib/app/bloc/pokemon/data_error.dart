import "package:mimi_pokemon_app/app/bloc/pokemon/pokemon_state.dart";

class DataError extends PokemonState {
  const DataError(this.error);
  final String error;

  @override
  List<Object?> get props => [error];
}
