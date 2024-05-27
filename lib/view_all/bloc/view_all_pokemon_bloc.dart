import "package:flutter_bloc/flutter_bloc.dart";
import "package:freezed_annotation/freezed_annotation.dart";
import "package:mimi_pokemon_app/splash_screen/model/pokemon_model.dart";
import "package:mimi_pokemon_app/view_all/model/pokemon/pokemon.dart";
import "package:mimi_pokemon_app/view_all/repository/view_all_pokemon_repository.dart";

part "view_all_pokemon_bloc.freezed.dart";
part "view_all_pokemon_event.dart";
part "view_all_pokemon_state.dart";

class ViewAllPokemonBloc
    extends Bloc<ViewAllPokemonEvent, ViewAllPokemonState> {
  ViewAllPokemonBloc(this.repository) : super(const PokemonInitial()) {
    on<FetchPokemon>(_fetchPokemon);
    on<ItemSelected>(_itemSelected);
    on<SetFetchedPokemon>(_setFetchedPokemon);
    on<SetSelectedPokemon>(_setSelectedPokemon);
    on<CardTapped>(_cardTapped);
  }

  final ViewAllPokemonRepository repository;
  Future<void> _fetchPokemon(
    FetchPokemon event,
    Emitter<ViewAllPokemonState> emit,
  ) async {
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
          emit(PokemonError(error: error.toString()));
        });
      }

      emit(PokemonLoaded(pokemon: fetchedData, pokemonData: Pokemon()));
    } catch (error) {
      emit(PokemonError(error: error.toString()));
    }
  }

  void _itemSelected(ItemSelected event, Emitter<ViewAllPokemonState> emit) {
    emit(
      PokemonLoaded(
        pokemon: event.fetchedPokemon,
        pokemonData: event.selectedPokemon,
      ),
    );
  }

  void _setFetchedPokemon(
    SetFetchedPokemon event,
    Emitter<ViewAllPokemonState> emit,
  ) {
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
  }

  void _setSelectedPokemon(
    SetSelectedPokemon event,
    Emitter<ViewAllPokemonState> emit,
  ) {
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
  }

  void _cardTapped(CardTapped event, Emitter<ViewAllPokemonState> emit) {
    emit(CardShowingButton(selectedIndex: event.index));
  }
}
