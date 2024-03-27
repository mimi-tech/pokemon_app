import 'package:equatable/equatable.dart';
import 'package:phundit_app/model/pokemonnModel/pokemonModel.dart';

abstract class DataState extends Equatable {
  const DataState();

  @override
  List<Object?> get props => [];
}

class DataInitial extends DataState {}

class DataLoading extends DataState {}

class DataSuccess extends DataState {

  const DataSuccess(this.data);
  final List<PokemonModel> data;

  @override
  List<Object?> get props => [data];
}

class DataError extends DataState {

  const DataError(this.error);
  final dynamic error;

  @override
  List<Object?> get props => [error];
}



class WeatherState extends Equatable {

  final PokemonModel? pokemonModel;

  const WeatherState({

    required this.pokemonModel,
  });

  WeatherState copyWith({

    PokemonModel? pokemonModel,
  }) =>
      WeatherState(

        pokemonModel: pokemonModel ?? this.pokemonModel,
      );

  @override
  List<Object?> get props => [pokemonModel];

// ...
}