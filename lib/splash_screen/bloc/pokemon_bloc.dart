import "package:freezed_annotation/freezed_annotation.dart";
import "package:hydrated_bloc/hydrated_bloc.dart";
import "package:mimi_pokemon_app/splash_screen/model/pokemon_model.dart";
import "package:mimi_pokemon_app/splash_screen/repository/splash_screen_repository.dart";

part "pokemon_bloc.freezed.dart";
part "pokemon_event.dart";
part "pokemon_state.dart";

class PokemonBloc extends HydratedBloc<PokemonEvent, PokemonState> {
  PokemonBloc(this.repository) : super(const DataInitial()) {
    on<LoadData>(_loadData);
  }

  final SplashScreenRepository repository;

  @override
  PokemonState? fromJson(Map<String, dynamic> json) {
    try {
      final pokemonList = (json["pokemonList"] as List)
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
        ? {"pokemonList": state.data.map((e) => e.toJson()).toList()}
        : null;
  }

  Future<void> _loadData(LoadData event, Emitter<PokemonState> emit) async {
    emit(const DataLoading());
    final result = await repository.fetchPokemon();
    result.when(
      (success) {
        emit(DataSuccess(success));
      },
      (error) {
        emit(DataError(error.toString()));
      },
    );
  }
}
