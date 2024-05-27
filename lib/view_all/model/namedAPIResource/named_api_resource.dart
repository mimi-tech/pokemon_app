import "package:freezed_annotation/freezed_annotation.dart";

part "named_api_resource.freezed.dart";
part "named_api_resource.g.dart";

@Freezed()
class NamedAPIResource with _$NamedAPIResource {
  factory NamedAPIResource({String? name, String? url}) = _NamedAPIResource;
  const NamedAPIResource._();

  factory NamedAPIResource.fromJson(Map<String, dynamic> json) =>
      _$NamedAPIResourceFromJson(json);
}
