import 'package:equatable/equatable.dart';

abstract class PokemonEvent extends Equatable {
  @override
  List<Object?> get props => [];

  const PokemonEvent();
}

class LoadData extends PokemonEvent {}
