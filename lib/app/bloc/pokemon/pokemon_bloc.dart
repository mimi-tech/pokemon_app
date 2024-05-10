import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:phundit_app/app/bloc/pokemon/pokemon_event.dart';
import 'package:phundit_app/app/bloc/pokemon/pokemon_state.dart';
import 'package:phundit_app/model/pokemonnModel/pokemonModel.dart';
import 'package:phundit_app/services/pokemon_service.dart';

class PokemonBloc extends HydratedBloc<PokemonEvent, PokemonState> {
  final PokemonService repository;
  PokemonBloc(this.repository) : super(DataInitial()) {
    on<LoadData>((
      event,
      emit,
    ) async {
      emit(DataLoading());
      final result = await repository.fetchPokemon();
      result.when(
        (success) {
          emit(DataSuccess(success));
        },
        (error) {
          emit(DataError(error.toString()));
        },
      );
    });
  }

  @override
  PokemonState? fromJson(Map<String, dynamic> json) {
    try {
      final pokemonList = (json['pokemonList'] as List)
          .map((item) => PokemonModel.fromJson(item as Map<String, Object>))
          .toList();

      return DataSuccess(pokemonList);
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(PokemonState state) {
    return state is DataSuccess
        ? {'pokemonList': state.data.map((e) => e.toJson()).toList()}
        : null;
  }
}
