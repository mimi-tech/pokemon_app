part of "side_model_bloc.dart";

@freezed
class SideModelEvent with _$SideModelEvent {
  const factory SideModelEvent.updateTypes({
    required List<Pokemon> pokemonList,
    required List<Types> types,
  }) = UpdateTypes;
}
