import "package:freezed_annotation/freezed_annotation.dart";

part "pokemon_model.g.dart";

@JsonSerializable()
class PokemonModel {
  const PokemonModel(this.name, this.url);

  factory PokemonModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonModelFromJson(json);
  @JsonKey(name: "name")
  final String name;

  @JsonKey(name: "url")
  final String url;

  Map<String, dynamic> toJson() => _$PokemonModelToJson(this);
}
