// ignore_for_file: non_constant_identifier_names

import "package:flutter/foundation.dart";
import "package:freezed_annotation/freezed_annotation.dart";

part "dream_world.freezed.dart";
part "dream_world.g.dart";

@Freezed()
class DreamWorld with _$DreamWorld {
  factory DreamWorld({String? front_default, String? front_female}) =
      _DreamWorld;
  const DreamWorld._();

  factory DreamWorld.fromJson(Map<String, dynamic> json) =>
      _$DreamWorldFromJson(json);
}
