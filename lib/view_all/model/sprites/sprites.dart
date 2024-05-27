import "package:flutter/foundation.dart";
import "package:freezed_annotation/freezed_annotation.dart";
import "package:mimi_pokemon_app/view_all/model/other/other.dart";

part "sprites.freezed.dart";
part "sprites.g.dart";

@Freezed()
class Sprites with _$Sprites {
  factory Sprites({Other? other}) = _Sprites;
  const Sprites._();

  factory Sprites.fromJson(Map<String, dynamic> json) =>
      _$SpritesFromJson(json);
}
