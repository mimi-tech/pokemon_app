import "package:flutter/foundation.dart";
import "package:freezed_annotation/freezed_annotation.dart";
import "package:mimi_pokemon_app/view_all/model/ability/ability.dart";
import "package:mimi_pokemon_app/view_all/model/form/form.dart";
import "package:mimi_pokemon_app/view_all/model/species/species.dart";
import "package:mimi_pokemon_app/view_all/model/sprites/sprites.dart";
import "package:mimi_pokemon_app/view_all/model/stat/stat.dart";
import "package:mimi_pokemon_app/view_all/model/type/types.dart";

part "pokemon.freezed.dart";
part "pokemon.g.dart";

@Freezed()
class Pokemon with _$Pokemon {
  factory Pokemon({
    List<Ability>? abilities,
    List<Form>? forms,
    int? height,
    String? name,
    Species? species,
    Sprites? sprites,
    List<Stat>? stats,
    List<Types>? types,
    int? weight,
  }) = _Pokemon;
  const Pokemon._();

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);
}
