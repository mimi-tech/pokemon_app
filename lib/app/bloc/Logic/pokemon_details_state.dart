import 'package:equatable/equatable.dart';
import 'package:phundit_app/model/pokemon/pokemon.dart';

abstract class PokemonDetailsState extends Equatable {
  @override
  List<Object> get props => [];
  const PokemonDetailsState();
}

class PokemonInitial extends PokemonDetailsState {
  const PokemonInitial();
}

class PokemonLoading extends PokemonDetailsState {
  const PokemonLoading();
}

class PokemonLoaded extends PokemonDetailsState {
  final List<Pokemon> pokemon;
  final Pokemon pokemonData;

  @override
  List<Object> get props => [
        pokemon,
        pokemonData,
      ];
  const PokemonLoaded(
    this.pokemon,
    this.pokemonData,
  );
}

class PokemonError extends PokemonDetailsState {
  final String error;

  @override
  List<Object> get props => [error];
  const PokemonError(this.error);
}

abstract class PokemonListState extends Equatable {
  @override
  List<Object> get props => [];
  const PokemonListState();
}

class InitialPokemonListState extends PokemonListState {
  final pokemonList = const <Pokemon>[];
  final selectedTypes = const <Map<String, dynamic>>[];
  const InitialPokemonListState();
}

class LoadedPokemonListState extends PokemonListState {
  final List<Pokemon> pokemonList;
  final List<Types> selectedTypes;

  @override
  List<Object> get props => [
        pokemonList,
        selectedTypes,
      ];
  const LoadedPokemonListState(
    this.pokemonList,
    this.selectedTypes,
  );
}

class ErrorPokemonListState extends PokemonDetailsState {
  final String error;

  @override
  List<Object> get props => [error];
  const ErrorPokemonListState(this.error);
}

abstract class HoverState extends Equatable {
  @override
  List<Object> get props => [];
  const HoverState();
}

abstract class CardState extends Equatable {
  @override
  List<Object> get props => [];
  const CardState();
}

class CardInitial extends CardState {}

class CardShowingButton extends CardState {
  final int selectedIndex;

  @override
  List<Object> get props => [selectedIndex];
  const CardShowingButton(this.selectedIndex);
}
