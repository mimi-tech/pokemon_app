import "package:equatable/equatable.dart";
import "package:phundit_app/model/pokemon/pokemon.dart";

abstract class PokemonDetailsState extends Equatable {
  const PokemonDetailsState();
  @override
  List<Object> get props => [];
}

class PokemonInitial extends PokemonDetailsState {
  const PokemonInitial();
}

class PokemonLoading extends PokemonDetailsState {
  const PokemonLoading();
}

class PokemonLoaded extends PokemonDetailsState {
  const PokemonLoaded(this.pokemon, this.pokemonData);
  final List<Pokemon> pokemon;
  final Pokemon pokemonData;
  @override
  List<Object> get props => [pokemon, pokemonData];
}

class PokemonError extends PokemonDetailsState {
  const PokemonError(this.error);
  final String error;
  @override
  List<Object> get props => [error];
}

abstract class PokemonListState extends Equatable {
  const PokemonListState();
  @override
  List<Object> get props => [];
}

class InitialPokemonListState extends PokemonListState {
  InitialPokemonListState();
  final pokemonList = <Pokemon>[];
  final selectedTypes = const <Map<String, dynamic>>[];
}

class LoadedPokemonListState extends PokemonListState {
  const LoadedPokemonListState(this.pokemonList, this.selectedTypes);
  final List<Pokemon> pokemonList;
  final List<Types> selectedTypes;
  @override
  List<Object> get props => [pokemonList, selectedTypes];
}

class ErrorPokemonListState extends PokemonDetailsState {
  const ErrorPokemonListState(this.error);
  final String error;
  @override
  List<Object> get props => [error];
}

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

class CardInitial extends CardState {
  const CardInitial();
}

class CardShowingButton extends CardState {
  const CardShowingButton(this.selectedIndex);
  final int selectedIndex;
  @override
  List<Object> get props => [selectedIndex];
}
