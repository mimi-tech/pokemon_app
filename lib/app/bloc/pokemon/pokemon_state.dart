import "package:equatable/equatable.dart";
import "package:phundit_app/model/pokemonnModel/pokemon_model.dart";

abstract class PokemonState extends Equatable {
  const PokemonState();
  @override
  List<Object?> get props => [];
}

class DataInitial extends PokemonState {
  const DataInitial();
}

class DataLoading extends PokemonState {
  const DataLoading();
}

class DataSuccess extends PokemonState {
  const DataSuccess(this.data);
  final List<PokemonModel> data;

  @override
  List<Object?> get props => [data];
}

class DataError extends PokemonState {
  const DataError(this.error);
  final String error;

  @override
  List<Object?> get props => [error];
}
