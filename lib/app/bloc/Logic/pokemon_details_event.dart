import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:phundit_app/model/pokemon/pokemon.dart';
import 'package:phundit_app/model/pokemonnModel/pokemonModel.dart';


abstract class PokemonEvent extends Equatable {
  const PokemonEvent();

  @override
  List<Object> get props => [];
}

class FetchPokemon extends PokemonEvent {

  const FetchPokemon( this.start, this.end, this.pokemonData);
  final int start;
  final int end;
  final List<PokemonModel> pokemonData;

  @override
  List<Object> get props => [start, end,pokemonData];
}


class ItemSelected extends PokemonEvent {
  final Pokemon selectedPokemon;
  final List <Pokemon> fetchedPokemon;

  const ItemSelected(
      this.selectedPokemon,
      this.fetchedPokemon);

  @override
  List<Object> get props => [selectedPokemon,fetchedPokemon];
}

class OpenDrawer extends PokemonEvent {
  const OpenDrawer();

  @override
  List<Object> get props => [];
}


// similar events.dart
abstract class PokemonListEvent extends Equatable {
  const PokemonListEvent();

  @override
  List<Object> get props => [];
}

class UpdateTypes extends PokemonListEvent {
  final List<Types> types;
  final List<Pokemon> pokemonList;
  const UpdateTypes(this.types, this.pokemonList);

  @override
  List<Object> get props => [types];
}


// events for hovering over card
abstract class CardEvent extends Equatable {
  const CardEvent();

  @override
  List<Object> get props => [];
}

class CardTapped extends CardEvent {
  final int index;

  const CardTapped(this.index);

  @override
  List<Object> get props => [index];
}