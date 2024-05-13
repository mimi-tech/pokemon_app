import "package:equatable/equatable.dart";
import "package:phundit_app/model/pokemon/pokemon.dart";
import "package:phundit_app/model/pokemonnModel/pokemon_model.dart";

abstract class PokemonDetailsEvent extends Equatable {
  const PokemonDetailsEvent();
  @override
  List<Object> get props => [];
}

class FetchPokemon extends PokemonDetailsEvent {
  const FetchPokemon(this.end, this.pokemonData, this.start);
  final int end;
  final List<PokemonModel> pokemonData;
  final int start;

  @override
  List<Object> get props => [end, pokemonData, start];
}

class ItemSelected extends PokemonDetailsEvent {
  const ItemSelected(this.fetchedPokemon, this.selectedPokemon);
  final Pokemon selectedPokemon;
  final List<Pokemon> fetchedPokemon;

  @override
  List<Object> get props => [selectedPokemon, fetchedPokemon];
}

class OpenDrawer extends PokemonDetailsEvent {
  const OpenDrawer();
  @override
  List<Object> get props => [];
}

abstract class PokemonListEvent extends Equatable {
  const PokemonListEvent();
  @override
  List<Object> get props => [];
}

class UpdateTypes extends PokemonListEvent {
  const UpdateTypes(this.pokemonList, this.types);
  final List<Types> types;
  final List<Pokemon> pokemonList;

  @override
  List<Object> get props => [types, pokemonList];
}

abstract class CardEvent extends Equatable {
  const CardEvent();
  @override
  List<Object> get props => [];
}

class CardTapped extends CardEvent {
  const CardTapped(this.index);
  final int index;

  @override
  List<Object> get props => [index];
}
