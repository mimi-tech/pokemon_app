import "package:flutter_bloc/flutter_bloc.dart";
import "package:freezed_annotation/freezed_annotation.dart";
import "package:mimi_pokemon_app/sideModel/components/dominant_color.dart";
import "package:mimi_pokemon_app/view_all/model/pokemon/pokemon.dart";
import "package:mimi_pokemon_app/view_all/model/type/types.dart";

part "side_model_bloc.freezed.dart";
part "side_model_event.dart";
part "side_model_state.dart";

class SideModelBloc extends Bloc<SideModelEvent, SideModelState> {
  SideModelBloc() : super(const InitialPokemonListState()) {
    on<UpdateTypes>(_updateTypes);
  }
  void _updateTypes(UpdateTypes event, Emitter<SideModelState> emit) {
    final selectedTypes = event.types;
    final pokemonList = event.pokemonList;

    final matchedPokemon = const DominantColor().findMatchingPokemon(
      pokemonList,
      selectedTypes,
    );
    emit(
      LoadedPokemonListState(
        pokemonList: matchedPokemon,
        selectedTypes: selectedTypes,
      ),
    );
  }
}
