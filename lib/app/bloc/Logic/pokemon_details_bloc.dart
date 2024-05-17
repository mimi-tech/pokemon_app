import "package:flutter_bloc/flutter_bloc.dart";
import "package:mimi_pokemon_app/app/bloc/Logic/fetch_pokemon.dart";
import "package:mimi_pokemon_app/app/bloc/Logic/item_selected.dart";
import "package:mimi_pokemon_app/app/bloc/Logic/pokemon_details_event.dart";
import "package:mimi_pokemon_app/app/bloc/Logic/pokemon_details_state.dart";
import "package:mimi_pokemon_app/app/bloc/Logic/pokemon_error.dart";
import "package:mimi_pokemon_app/app/bloc/Logic/pokemon_initial.dart";
import "package:mimi_pokemon_app/app/bloc/Logic/pokemon_load_success.dart";
import "package:mimi_pokemon_app/app/bloc/Logic/pokemon_loaded.dart";
import "package:mimi_pokemon_app/app/bloc/Logic/pokemon_loading.dart";
import "package:mimi_pokemon_app/app/bloc/Logic/set_fetched_pokemon.dart";
import "package:mimi_pokemon_app/app/bloc/Logic/set_selected_pokemon.dart";
import "package:mimi_pokemon_app/model/pokemon/pokemon.dart";
import "package:mimi_pokemon_app/services/pokemon_service.dart";

class PokemonDetailsBloc
    extends Bloc<PokemonDetailsEvent, PokemonDetailsState> {
  PokemonDetailsBloc(this.repository) : super(const PokemonInitial()) {
    on<FetchPokemon>((event, emit) async {
      try {
        emit(const PokemonLoading());

        final fetchedData = <Pokemon>[];
        final numsRange = List.generate(
          event.end - event.start,
          (index) => event.start + index,
        );

        for (final nums in numsRange) {
          final result = await repository.fetchPokemonDetails(
            event.pokemonData.elementAtOrNull(nums)?.url?.toString() ?? "",
          );

          result.when(fetchedData.add, (error) {
            emit(PokemonError(error.toString()));
          });
        }

        emit(PokemonLoaded(fetchedData, Pokemon()));
      } catch (error) {
        emit(PokemonError(error.toString()));
      }
    });

    on<ItemSelected>((event, emit) {
      emit(PokemonLoaded(event.fetchedPokemon, event.selectedPokemon));
    });

    on<SetFetchedPokemon>((event, emit) {
      if (state is PokemonLoadSuccess) {
        final currentState = state as PokemonLoadSuccess;
        emit(
          PokemonLoadSuccess(
            fetchedPokemon: event.fetchedPokemon,
            selectedPokemon: currentState.selectedPokemon,
          ),
        );
      } else {
        emit(
          PokemonLoadSuccess(
            fetchedPokemon: event.fetchedPokemon,
            selectedPokemon: Pokemon(),
          ),
        );
      }
    });

    on<SetSelectedPokemon>((event, emit) {
      if (state is PokemonLoadSuccess) {
        final currentState = state as PokemonLoadSuccess;
        emit(
          PokemonLoadSuccess(
            fetchedPokemon: currentState.fetchedPokemon,
            selectedPokemon: event.selectedPokemon,
          ),
        );
      } else {
        emit(
          PokemonLoadSuccess(
            fetchedPokemon: const [],
            selectedPokemon: event.selectedPokemon,
          ),
        );
      }
    });
  }

  final PokemonService repository;
}
