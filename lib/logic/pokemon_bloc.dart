// data_bloc.dart
import 'package:bloc/bloc.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:phundit_app/logic/pokemon_event.dart';
import 'package:phundit_app/logic/pokemon_state.dart';
import 'package:phundit_app/model/pokemonnModel/pokemonModel.dart';
import 'package:phundit_app/services/feedback.dart';
import 'package:phundit_app/services/pokemon_service.dart';


class DataBloc extends HydratedBloc<DataEvent, DataState> {

  DataBloc(this.repository) : super( DataInitial()) {
    on<LoadData>((event, emit) async {
      emit( DataLoading());
      final result = await repository.fetchPokemon();
      result.when(
            (success) {

              final responseData = success["results"] as List;
              final data = responseData.map((json) =>
                PokemonModel.fromJson(json as Map<String, dynamic>),).toList();

              emit(DataSuccess(data));
        },
            (error) {

              emit(DataError(error));
        },
      );
    });
  }
  final PokeMonServices repository;

  @override
  DataState? fromJson(Map<String, dynamic> json) {
    try {
      final pokemonList = (json['pokemonList'] as List)
          .map((item) => PokemonModel.fromJson(item as Map<String, String>))
          .toList();
      return DataSuccess(pokemonList);
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(DataState state) {
    if (state is DataSuccess) {
      return {'pokemonList': state.data.map((e) => e.toJson()).toList()};
    }
    return null;
  }

  // @override
  // DataState fromJson(Map<String, dynamic> json) => DataState.fromJson(json);
  //
  // @override
  // Map<String, dynamic> toJson(DataState state) => state.toJson();
}
