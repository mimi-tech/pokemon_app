import 'package:equatable/equatable.dart';
import 'package:phundit_app/model/pokemonnModel/pokemonModel.dart';

abstract class PokemonState extends Equatable {
  @override
  List<Object?> get props => [];
  const PokemonState();
}

class DataInitial extends PokemonState {}

class DataLoading extends PokemonState {}

class DataSuccess extends PokemonState {
  final List<PokemonModel> data;

  @override
  List<Object?> get props => [data];
  const DataSuccess(this.data);
}

class DataError extends PokemonState {
  final String error;

  @override
  List<Object?> get props => [error];
  const DataError(this.error);
}


