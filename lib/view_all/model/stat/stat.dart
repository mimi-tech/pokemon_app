// ignore_for_file: non_constant_identifier_names

import "package:flutter/foundation.dart";
import "package:freezed_annotation/freezed_annotation.dart";
import "package:mimi_pokemon_app/view_all/model/namedAPIResource/named_api_resource.dart";

part "stat.freezed.dart";
part "stat.g.dart";

@Freezed()
class Stat with _$Stat {
  factory Stat({int? base_stat, int? effort, NamedAPIResource? stat}) = _Stat;
  const Stat._();

  factory Stat.fromJson(Map<String, dynamic> json) => _$StatFromJson(json);
}
