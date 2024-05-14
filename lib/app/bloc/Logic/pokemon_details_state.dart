import 'package:equatable/equatable.dart';
import 'package:phundit_app/model/pokemon/pokemon.dart';


abstract class PokemonState extends Equatable {
  const PokemonState();

  @override
  List<Object> get props => [];
}

class PokemonInitial extends PokemonState {}

class PokemonLoading extends PokemonState {}

class PokemonLoaded extends PokemonState {

  const PokemonLoaded(this.pokemon, this.pokemonData);
  final List<Pokemon> pokemon;
  final Pokemon? pokemonData;

  @override
  List<Object> get props => [pokemon,pokemonData!];
}

class PokemonError extends PokemonState {

  const PokemonError(this.error);
  final String error;

  @override
  List<Object> get props => [error];
}


// similar states.dart
abstract class PokemonListState extends Equatable {
  const PokemonListState();

  @override
  List<Object> get props => [];
}

class InitialPokemonListState extends PokemonListState {
  final List<Pokemon> pokemonList = const [];
  final List<Map<String, dynamic>> selectedTypes = const [];
}

class LoadedPokemonListState extends PokemonListState {

  const LoadedPokemonListState(this.pokemonList, this.selectedTypes);
  final List<Pokemon> pokemonList;
  final List<Types> selectedTypes;

  @override
  List<Object> get props => [pokemonList, selectedTypes];
}

class ErrorPokemonListState extends PokemonState {

  const ErrorPokemonListState(this.error);
  final String error;

  @override
  List<Object> get props => [error];
}

// States representing the card's hover state
// states
abstract class HoverState extends Equatable {
  const HoverState();

  @override
  List<Object> get props => [];
}

abstract class CardState extends Equatable {
  const CardState();

  @override
  List<Object> get props => [];
}

class CardInitial extends CardState {}

class CardShowingButton extends CardState {
  final int selectedIndex;

  const CardShowingButton(this.selectedIndex);

  @override
  List<Object> get props => [selectedIndex];
}




