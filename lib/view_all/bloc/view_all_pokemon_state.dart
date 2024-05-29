part of "view_all_pokemon_bloc.dart";

@freezed
class ViewAllPokemonState with _$ViewAllPokemonState {
  const factory ViewAllPokemonState.pokemonInitial() = PokemonInitial;
  const factory ViewAllPokemonState.pokemonLoading() = PokemonLoading;
  const factory ViewAllPokemonState.pokemonLoaded({
    required List<Pokemon> pokemon,
    required Pokemon pokemonData,
  }) = PokemonLoaded;
  const factory ViewAllPokemonState.pokemonError({required String error}) =
      PokemonError;
  const factory ViewAllPokemonState.errorPokemonListState({
    required String error,
  }) = ErrorPokemonListState;
  const factory ViewAllPokemonState.pokemonLoadSuccess({
    List<Pokemon>? fetchedPokemon,
    Pokemon? selectedPokemon,
  }) = PokemonLoadSuccess;

  const factory ViewAllPokemonState.cardInitial() = CardInitial;
  const factory ViewAllPokemonState.cardShowingButton({
    required int selectedIndex,
  }) = CardShowingButton;
}
