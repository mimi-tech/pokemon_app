import "package:mimi_pokemon_app/app/bloc/Logic/pokemon_list_event.dart";
import "package:mimi_pokemon_app/model/pokemon/pokemon.dart";
import "package:mimi_pokemon_app/model/type/types.dart";

class UpdateTypes extends PokemonListEvent {
  const UpdateTypes(this.pokemonList, this.types);
  final List<Types> types;
  final List<Pokemon> pokemonList;

  @override
  List<Object> get props => [types, pokemonList];
}
