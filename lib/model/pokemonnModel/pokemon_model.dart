import "package:flutter/foundation.dart";
import "package:freezed_annotation/freezed_annotation.dart";

part "pokemon_model.freezed.dart";
part "pokemon_model.g.dart";

@Freezed()
class PokemonModel with _$PokemonModel {
  factory PokemonModel({String? name, String? url}) = _PokemonModel;
  const PokemonModel._();

  factory PokemonModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonModelFromJson(json);
}
