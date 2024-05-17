/*
 When I added an int as an annotation. I was still getting the error
 */

import "package:flutter_bloc/flutter_bloc.dart";
import "package:mimi_pokemon_app/app/bloc/Logic/dominant_color.dart";
import "package:mimi_pokemon_app/app/bloc/Logic/initial_pokemon_list_state.dart";
import "package:mimi_pokemon_app/app/bloc/Logic/loaded_pokemon_list_state.dart";
import "package:mimi_pokemon_app/app/bloc/Logic/pokemon_list_event.dart";
import "package:mimi_pokemon_app/app/bloc/Logic/pokemon_list_state.dart";
import "package:mimi_pokemon_app/app/bloc/Logic/update_types.dart";

class PokemonListBloc extends Bloc<PokemonListEvent, PokemonListState> {
  PokemonListBloc() : super(InitialPokemonListState()) {
    on<UpdateTypes>((event, emit) {
      final selectedTypes = event.types;
      final pokemonList = event.pokemonList;

      final matchedPokemon = const DominantColor().findMatchingPokemon(
        pokemonList,
        selectedTypes,
      );
      emit(LoadedPokemonListState(matchedPokemon, selectedTypes));
    });
  }
}
