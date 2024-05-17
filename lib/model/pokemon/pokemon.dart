// ignore_for_file: non_constant_identifier_names

import "package:flutter/foundation.dart";
import "package:freezed_annotation/freezed_annotation.dart";
import "package:mimi_pokemon_app/model/ability/ability.dart";
import "package:mimi_pokemon_app/model/form/form.dart";
import "package:mimi_pokemon_app/model/species/species.dart";
import "package:mimi_pokemon_app/model/sprites/sprites.dart";
import "package:mimi_pokemon_app/model/stat/stat.dart";
import "package:mimi_pokemon_app/model/type/types.dart";

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
