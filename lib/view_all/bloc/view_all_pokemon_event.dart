part of "view_all_pokemon_bloc.dart";

@freezed
class ViewAllPokemonEvent with _$ViewAllPokemonEvent {
  const factory ViewAllPokemonEvent.fetchPokemon({
    required int end,
    required List<PokemonModel> pokemonData,
    required int start,
  }) = FetchPokemon;

  const factory ViewAllPokemonEvent.itemSelected({
    required List<Pokemon> fetchedPokemon,
    required Pokemon selectedPokemon,
  }) = ItemSelected;

  const factory ViewAllPokemonEvent.openDrawer() = OpenDrawer;

  const factory ViewAllPokemonEvent.setSelectedPokemon({
    required Pokemon selectedPokemon,
  }) = SetSelectedPokemon;

  const factory ViewAllPokemonEvent.setFetchedPokemon({
    required List<Pokemon> fetchedPokemon,
  }) = SetFetchedPokemon;

  const factory ViewAllPokemonEvent.cardTapped({required int index}) =
      CardTapped;
}
