import "package:equatable/equatable.dart";

abstract class PokemonEvent extends Equatable {
  const PokemonEvent();
  @override
  List<Object?> get props => [];
}

class LoadData extends PokemonEvent {}
