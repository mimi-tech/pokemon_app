import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'pokemonModel.freezed.dart';
part 'pokemonModel.g.dart';

@Freezed()
class PokemonModel with _$PokemonModel {
  factory PokemonModel({
    String? name,
    String? url,
  }) = _PokemonModel;
  const PokemonModel._();

  factory PokemonModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonModelFromJson(json);
}
