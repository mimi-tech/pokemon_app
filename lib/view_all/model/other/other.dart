// ignore_for_file: non_constant_identifier_names

import "package:flutter/foundation.dart";
import "package:freezed_annotation/freezed_annotation.dart";
import "package:mimi_pokemon_app/view_all/model/dreamWorld/dream_world.dart";

part "other.freezed.dart";
part "other.g.dart";

@Freezed()
class Other with _$Other {
  factory Other({DreamWorld? dream_world}) = _Other;
  const Other._();

  factory Other.fromJson(Map<String, dynamic> json) => _$OtherFromJson(json);
}
