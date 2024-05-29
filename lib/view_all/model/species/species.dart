import "package:flutter/foundation.dart";
import "package:freezed_annotation/freezed_annotation.dart";

part "species.freezed.dart";
part "species.g.dart";

@Freezed()
class Species with _$Species {
  factory Species({String? name, String? url}) = _Species;
  const Species._();

  factory Species.fromJson(Map<String, dynamic> json) =>
      _$SpeciesFromJson(json);
}
