part of "side_model_bloc.dart";

@freezed
class SideModelState with _$SideModelState {
  const factory SideModelState.initialPokemonListState() =
      InitialPokemonListState;
  const factory SideModelState.loadedPokemonListState({
    required List<Pokemon> pokemonList,
    required List<Types> selectedTypes,
  }) = LoadedPokemonListState;
}
