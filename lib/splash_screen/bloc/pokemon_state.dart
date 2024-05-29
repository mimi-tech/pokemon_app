part of "pokemon_bloc.dart";

@freezed
class PokemonState with _$PokemonState {
  const factory PokemonState.dataInitial() = DataInitial;
  const factory PokemonState.dataLoading() = DataLoading;
  const factory PokemonState.dataSuccess(List<PokemonModel> data) = DataSuccess;
  const factory PokemonState.dataError(String error) = DataError;
}
