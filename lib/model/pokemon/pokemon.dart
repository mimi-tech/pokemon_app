import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'pokemon.freezed.dart';
part 'pokemon.g.dart';

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

@Freezed()
class Ability with _$Ability {
  factory Ability({
    NamedAPIResource? ability,
    bool? isHidden,
    required int slot,
  }) = _Ability;
  const Ability._();

  factory Ability.fromJson(Map<String, dynamic> json) =>
      _$AbilityFromJson(json);
}

@Freezed()
class NamedAPIResource with _$NamedAPIResource {
  factory NamedAPIResource({
    String? name,
    String? url,
  }) = _NamedAPIResource;
  const NamedAPIResource._();

  factory NamedAPIResource.fromJson(Map<String, dynamic> json) =>
      _$NamedAPIResourceFromJson(json);
}

@Freezed()
class Form with _$Form {
  factory Form({
    String? name,
    String? url,
  }) = _Form;
  const Form._();

  factory Form.fromJson(Map<String, dynamic> json) => _$FormFromJson(json);
}

@Freezed()
class Species with _$Species {
  factory Species({
    String? name,
    String? url,
  }) = _Species;
  const Species._();

  factory Species.fromJson(Map<String, dynamic> json) =>
      _$SpeciesFromJson(json);
}

@Freezed()
class Sprites with _$Sprites {
  factory Sprites({Other? other}) = _Sprites;
  const Sprites._();

  factory Sprites.fromJson(Map<String, dynamic> json) =>
      _$SpritesFromJson(json);
}

@Freezed()
class Other with _$Other {
  factory Other({DreamWorld? dream_world}) = _Other;
  const Other._();

  factory Other.fromJson(Map<String, dynamic> json) => _$OtherFromJson(json);
}

@Freezed()
class DreamWorld with _$DreamWorld {
  factory DreamWorld({
    String? front_default,
    String? front_female,
  }) = _DreamWorld;
  const DreamWorld._();

  factory DreamWorld.fromJson(Map<String, dynamic> json) =>
      _$DreamWorldFromJson(json);
}

@Freezed()
class Stat with _$Stat {
  factory Stat({
    int? base_stat,
    int? effort,
    NamedAPIResource? stat,
  }) = _Stat;
  const Stat._();

  factory Stat.fromJson(Map<String, dynamic> json) => _$StatFromJson(json);
}

@Freezed()
class Types with _$Types {
  factory Types({
    int? slot,
    NamedAPIResource? type,
  }) = _Types;
  const Types._();

  factory Types.fromJson(Map<String, dynamic> json) => _$TypesFromJson(json);
}

