import "package:mimi_pokemon_app/app/bloc/pokemon/pokemon_state.dart";
import "package:mimi_pokemon_app/model/pokemonnModel/pokemon_model.dart";

class DataSuccess extends PokemonState {
  const DataSuccess(this.data);
  final List<PokemonModel> data;

  @override
  List<Object?> get props => [data];
}
