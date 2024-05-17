import "package:flutter/foundation.dart";
import "package:freezed_annotation/freezed_annotation.dart";
import "package:mimi_pokemon_app/model/namedAPIResource/named_api_resource.dart";

part "ability.freezed.dart";
part "ability.g.dart";

@Freezed()
class Ability with _$Ability {
  factory Ability({
    required NamedAPIResource? ability,
    required bool? isHidden,
    required int slot,
  }) = _Ability;
  const Ability._();

  factory Ability.fromJson(Map<String, dynamic> json) =>
      _$AbilityFromJson(json);
}
