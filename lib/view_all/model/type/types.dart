import "package:flutter/foundation.dart";
import "package:freezed_annotation/freezed_annotation.dart";
import "package:mimi_pokemon_app/view_all/model/namedAPIResource/named_api_resource.dart";

part "types.freezed.dart";
part "types.g.dart";

@Freezed()
class Types with _$Types {
  factory Types({int? slot, NamedAPIResource? type}) = _Types;
  const Types._();

  factory Types.fromJson(Map<String, dynamic> json) => _$TypesFromJson(json);
}
