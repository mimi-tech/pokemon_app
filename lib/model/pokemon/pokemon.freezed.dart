// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Pokemon _$PokemonFromJson(Map<String, dynamic> json) {
  return _Pokemon.fromJson(json);
}

/// @nodoc
mixin _$Pokemon {
  List<Ability>? get abilities => throw _privateConstructorUsedError;
  List<Form>? get forms => throw _privateConstructorUsedError;
  int? get height => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  Species? get species => throw _privateConstructorUsedError;
  Sprites? get sprites => throw _privateConstructorUsedError;
  List<Stat>? get stats => throw _privateConstructorUsedError;
  List<Types>? get types => throw _privateConstructorUsedError;
  int? get weight => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PokemonCopyWith<Pokemon> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonCopyWith<$Res> {
  factory $PokemonCopyWith(Pokemon value, $Res Function(Pokemon) then) =
      _$PokemonCopyWithImpl<$Res, Pokemon>;
  @useResult
  $Res call(
      {List<Ability>? abilities,
      List<Form>? forms,
      int? height,
      String? name,
      Species? species,
      Sprites? sprites,
      List<Stat>? stats,
      List<Types>? types,
      int? weight});

  $SpeciesCopyWith<$Res>? get species;
  $SpritesCopyWith<$Res>? get sprites;
}

/// @nodoc
class _$PokemonCopyWithImpl<$Res, $Val extends Pokemon>
    implements $PokemonCopyWith<$Res> {
  _$PokemonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? abilities = freezed,
    Object? forms = freezed,
    Object? height = freezed,
    Object? name = freezed,
    Object? species = freezed,
    Object? sprites = freezed,
    Object? stats = freezed,
    Object? types = freezed,
    Object? weight = freezed,
  }) {
    return _then(_value.copyWith(
      abilities: freezed == abilities
          ? _value.abilities
          : abilities // ignore: cast_nullable_to_non_nullable
              as List<Ability>?,
      forms: freezed == forms
          ? _value.forms
          : forms // ignore: cast_nullable_to_non_nullable
              as List<Form>?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      species: freezed == species
          ? _value.species
          : species // ignore: cast_nullable_to_non_nullable
              as Species?,
      sprites: freezed == sprites
          ? _value.sprites
          : sprites // ignore: cast_nullable_to_non_nullable
              as Sprites?,
      stats: freezed == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as List<Stat>?,
      types: freezed == types
          ? _value.types
          : types // ignore: cast_nullable_to_non_nullable
              as List<Types>?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SpeciesCopyWith<$Res>? get species {
    if (_value.species == null) {
      return null;
    }

    return $SpeciesCopyWith<$Res>(_value.species!, (value) {
      return _then(_value.copyWith(species: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SpritesCopyWith<$Res>? get sprites {
    if (_value.sprites == null) {
      return null;
    }

    return $SpritesCopyWith<$Res>(_value.sprites!, (value) {
      return _then(_value.copyWith(sprites: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PokemonImplCopyWith<$Res> implements $PokemonCopyWith<$Res> {
  factory _$$PokemonImplCopyWith(
          _$PokemonImpl value, $Res Function(_$PokemonImpl) then) =
      __$$PokemonImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Ability>? abilities,
      List<Form>? forms,
      int? height,
      String? name,
      Species? species,
      Sprites? sprites,
      List<Stat>? stats,
      List<Types>? types,
      int? weight});

  @override
  $SpeciesCopyWith<$Res>? get species;
  @override
  $SpritesCopyWith<$Res>? get sprites;
}

/// @nodoc
class __$$PokemonImplCopyWithImpl<$Res>
    extends _$PokemonCopyWithImpl<$Res, _$PokemonImpl>
    implements _$$PokemonImplCopyWith<$Res> {
  __$$PokemonImplCopyWithImpl(
      _$PokemonImpl _value, $Res Function(_$PokemonImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? abilities = freezed,
    Object? forms = freezed,
    Object? height = freezed,
    Object? name = freezed,
    Object? species = freezed,
    Object? sprites = freezed,
    Object? stats = freezed,
    Object? types = freezed,
    Object? weight = freezed,
  }) {
    return _then(_$PokemonImpl(
      abilities: freezed == abilities
          ? _value._abilities
          : abilities // ignore: cast_nullable_to_non_nullable
              as List<Ability>?,
      forms: freezed == forms
          ? _value._forms
          : forms // ignore: cast_nullable_to_non_nullable
              as List<Form>?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      species: freezed == species
          ? _value.species
          : species // ignore: cast_nullable_to_non_nullable
              as Species?,
      sprites: freezed == sprites
          ? _value.sprites
          : sprites // ignore: cast_nullable_to_non_nullable
              as Sprites?,
      stats: freezed == stats
          ? _value._stats
          : stats // ignore: cast_nullable_to_non_nullable
              as List<Stat>?,
      types: freezed == types
          ? _value._types
          : types // ignore: cast_nullable_to_non_nullable
              as List<Types>?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PokemonImpl extends _Pokemon with DiagnosticableTreeMixin {
  _$PokemonImpl(
      {final List<Ability>? abilities,
      final List<Form>? forms,
      this.height,
      this.name,
      this.species,
      this.sprites,
      final List<Stat>? stats,
      final List<Types>? types,
      this.weight})
      : _abilities = abilities,
        _forms = forms,
        _stats = stats,
        _types = types,
        super._();

  factory _$PokemonImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokemonImplFromJson(json);

  final List<Ability>? _abilities;
  @override
  List<Ability>? get abilities {
    final value = _abilities;
    if (value == null) return null;
    if (_abilities is EqualUnmodifiableListView) return _abilities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Form>? _forms;
  @override
  List<Form>? get forms {
    final value = _forms;
    if (value == null) return null;
    if (_forms is EqualUnmodifiableListView) return _forms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? height;
  @override
  final String? name;
  @override
  final Species? species;
  @override
  final Sprites? sprites;
  final List<Stat>? _stats;
  @override
  List<Stat>? get stats {
    final value = _stats;
    if (value == null) return null;
    if (_stats is EqualUnmodifiableListView) return _stats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Types>? _types;
  @override
  List<Types>? get types {
    final value = _types;
    if (value == null) return null;
    if (_types is EqualUnmodifiableListView) return _types;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? weight;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Pokemon(abilities: $abilities, forms: $forms, height: $height, name: $name, species: $species, sprites: $sprites, stats: $stats, types: $types, weight: $weight)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Pokemon'))
      ..add(DiagnosticsProperty('abilities', abilities))
      ..add(DiagnosticsProperty('forms', forms))
      ..add(DiagnosticsProperty('height', height))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('species', species))
      ..add(DiagnosticsProperty('sprites', sprites))
      ..add(DiagnosticsProperty('stats', stats))
      ..add(DiagnosticsProperty('types', types))
      ..add(DiagnosticsProperty('weight', weight));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonImpl &&
            const DeepCollectionEquality()
                .equals(other._abilities, _abilities) &&
            const DeepCollectionEquality().equals(other._forms, _forms) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.species, species) || other.species == species) &&
            (identical(other.sprites, sprites) || other.sprites == sprites) &&
            const DeepCollectionEquality().equals(other._stats, _stats) &&
            const DeepCollectionEquality().equals(other._types, _types) &&
            (identical(other.weight, weight) || other.weight == weight));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_abilities),
      const DeepCollectionEquality().hash(_forms),
      height,
      name,
      species,
      sprites,
      const DeepCollectionEquality().hash(_stats),
      const DeepCollectionEquality().hash(_types),
      weight);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonImplCopyWith<_$PokemonImpl> get copyWith =>
      __$$PokemonImplCopyWithImpl<_$PokemonImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PokemonImplToJson(
      this,
    );
  }
}

abstract class _Pokemon extends Pokemon {
  factory _Pokemon(
      {final List<Ability>? abilities,
      final List<Form>? forms,
      final int? height,
      final String? name,
      final Species? species,
      final Sprites? sprites,
      final List<Stat>? stats,
      final List<Types>? types,
      final int? weight}) = _$PokemonImpl;
  _Pokemon._() : super._();

  factory _Pokemon.fromJson(Map<String, dynamic> json) = _$PokemonImpl.fromJson;

  @override
  List<Ability>? get abilities;
  @override
  List<Form>? get forms;
  @override
  int? get height;
  @override
  String? get name;
  @override
  Species? get species;
  @override
  Sprites? get sprites;
  @override
  List<Stat>? get stats;
  @override
  List<Types>? get types;
  @override
  int? get weight;
  @override
  @JsonKey(ignore: true)
  _$$PokemonImplCopyWith<_$PokemonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Ability _$AbilityFromJson(Map<String, dynamic> json) {
  return _Ability.fromJson(json);
}

/// @nodoc
mixin _$Ability {
  int get slot => throw _privateConstructorUsedError;
  NamedAPIResource? get ability => throw _privateConstructorUsedError;
  bool? get isHidden => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AbilityCopyWith<Ability> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AbilityCopyWith<$Res> {
  factory $AbilityCopyWith(Ability value, $Res Function(Ability) then) =
      _$AbilityCopyWithImpl<$Res, Ability>;
  @useResult
  $Res call({int slot, NamedAPIResource? ability, bool? isHidden});

  $NamedAPIResourceCopyWith<$Res>? get ability;
}

/// @nodoc
class _$AbilityCopyWithImpl<$Res, $Val extends Ability>
    implements $AbilityCopyWith<$Res> {
  _$AbilityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? slot = null,
    Object? ability = freezed,
    Object? isHidden = freezed,
  }) {
    return _then(_value.copyWith(
      slot: null == slot
          ? _value.slot
          : slot // ignore: cast_nullable_to_non_nullable
              as int,
      ability: freezed == ability
          ? _value.ability
          : ability // ignore: cast_nullable_to_non_nullable
              as NamedAPIResource?,
      isHidden: freezed == isHidden
          ? _value.isHidden
          : isHidden // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NamedAPIResourceCopyWith<$Res>? get ability {
    if (_value.ability == null) {
      return null;
    }

    return $NamedAPIResourceCopyWith<$Res>(_value.ability!, (value) {
      return _then(_value.copyWith(ability: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AbilityImplCopyWith<$Res> implements $AbilityCopyWith<$Res> {
  factory _$$AbilityImplCopyWith(
          _$AbilityImpl value, $Res Function(_$AbilityImpl) then) =
      __$$AbilityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int slot, NamedAPIResource? ability, bool? isHidden});

  @override
  $NamedAPIResourceCopyWith<$Res>? get ability;
}

/// @nodoc
class __$$AbilityImplCopyWithImpl<$Res>
    extends _$AbilityCopyWithImpl<$Res, _$AbilityImpl>
    implements _$$AbilityImplCopyWith<$Res> {
  __$$AbilityImplCopyWithImpl(
      _$AbilityImpl _value, $Res Function(_$AbilityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? slot = null,
    Object? ability = freezed,
    Object? isHidden = freezed,
  }) {
    return _then(_$AbilityImpl(
      slot: null == slot
          ? _value.slot
          : slot // ignore: cast_nullable_to_non_nullable
              as int,
      ability: freezed == ability
          ? _value.ability
          : ability // ignore: cast_nullable_to_non_nullable
              as NamedAPIResource?,
      isHidden: freezed == isHidden
          ? _value.isHidden
          : isHidden // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AbilityImpl extends _Ability with DiagnosticableTreeMixin {
  _$AbilityImpl({required this.slot, this.ability, this.isHidden}) : super._();

  factory _$AbilityImpl.fromJson(Map<String, dynamic> json) =>
      _$$AbilityImplFromJson(json);

  @override
  final int slot;
  @override
  final NamedAPIResource? ability;
  @override
  final bool? isHidden;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Ability(slot: $slot, ability: $ability, isHidden: $isHidden)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Ability'))
      ..add(DiagnosticsProperty('slot', slot))
      ..add(DiagnosticsProperty('ability', ability))
      ..add(DiagnosticsProperty('isHidden', isHidden));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AbilityImpl &&
            (identical(other.slot, slot) || other.slot == slot) &&
            (identical(other.ability, ability) || other.ability == ability) &&
            (identical(other.isHidden, isHidden) ||
                other.isHidden == isHidden));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, slot, ability, isHidden);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AbilityImplCopyWith<_$AbilityImpl> get copyWith =>
      __$$AbilityImplCopyWithImpl<_$AbilityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AbilityImplToJson(
      this,
    );
  }
}

abstract class _Ability extends Ability {
  factory _Ability(
      {required final int slot,
      final NamedAPIResource? ability,
      final bool? isHidden}) = _$AbilityImpl;
  _Ability._() : super._();

  factory _Ability.fromJson(Map<String, dynamic> json) = _$AbilityImpl.fromJson;

  @override
  int get slot;
  @override
  NamedAPIResource? get ability;
  @override
  bool? get isHidden;
  @override
  @JsonKey(ignore: true)
  _$$AbilityImplCopyWith<_$AbilityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NamedAPIResource _$NamedAPIResourceFromJson(Map<String, dynamic> json) {
  return _NamedAPIResource.fromJson(json);
}

/// @nodoc
mixin _$NamedAPIResource {
  String? get name => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NamedAPIResourceCopyWith<NamedAPIResource> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NamedAPIResourceCopyWith<$Res> {
  factory $NamedAPIResourceCopyWith(
          NamedAPIResource value, $Res Function(NamedAPIResource) then) =
      _$NamedAPIResourceCopyWithImpl<$Res, NamedAPIResource>;
  @useResult
  $Res call({String? name, String? url});
}

/// @nodoc
class _$NamedAPIResourceCopyWithImpl<$Res, $Val extends NamedAPIResource>
    implements $NamedAPIResourceCopyWith<$Res> {
  _$NamedAPIResourceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? url = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NamedAPIResourceImplCopyWith<$Res>
    implements $NamedAPIResourceCopyWith<$Res> {
  factory _$$NamedAPIResourceImplCopyWith(_$NamedAPIResourceImpl value,
          $Res Function(_$NamedAPIResourceImpl) then) =
      __$$NamedAPIResourceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, String? url});
}

/// @nodoc
class __$$NamedAPIResourceImplCopyWithImpl<$Res>
    extends _$NamedAPIResourceCopyWithImpl<$Res, _$NamedAPIResourceImpl>
    implements _$$NamedAPIResourceImplCopyWith<$Res> {
  __$$NamedAPIResourceImplCopyWithImpl(_$NamedAPIResourceImpl _value,
      $Res Function(_$NamedAPIResourceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? url = freezed,
  }) {
    return _then(_$NamedAPIResourceImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NamedAPIResourceImpl extends _NamedAPIResource
    with DiagnosticableTreeMixin {
  _$NamedAPIResourceImpl({this.name, this.url}) : super._();

  factory _$NamedAPIResourceImpl.fromJson(Map<String, dynamic> json) =>
      _$$NamedAPIResourceImplFromJson(json);

  @override
  final String? name;
  @override
  final String? url;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NamedAPIResource(name: $name, url: $url)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NamedAPIResource'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('url', url));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NamedAPIResourceImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NamedAPIResourceImplCopyWith<_$NamedAPIResourceImpl> get copyWith =>
      __$$NamedAPIResourceImplCopyWithImpl<_$NamedAPIResourceImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NamedAPIResourceImplToJson(
      this,
    );
  }
}

abstract class _NamedAPIResource extends NamedAPIResource {
  factory _NamedAPIResource({final String? name, final String? url}) =
      _$NamedAPIResourceImpl;
  _NamedAPIResource._() : super._();

  factory _NamedAPIResource.fromJson(Map<String, dynamic> json) =
      _$NamedAPIResourceImpl.fromJson;

  @override
  String? get name;
  @override
  String? get url;
  @override
  @JsonKey(ignore: true)
  _$$NamedAPIResourceImplCopyWith<_$NamedAPIResourceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Form _$FormFromJson(Map<String, dynamic> json) {
  return _Form.fromJson(json);
}

/// @nodoc
mixin _$Form {
  String? get name => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FormCopyWith<Form> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormCopyWith<$Res> {
  factory $FormCopyWith(Form value, $Res Function(Form) then) =
      _$FormCopyWithImpl<$Res, Form>;
  @useResult
  $Res call({String? name, String? url});
}

/// @nodoc
class _$FormCopyWithImpl<$Res, $Val extends Form>
    implements $FormCopyWith<$Res> {
  _$FormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? url = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FormImplCopyWith<$Res> implements $FormCopyWith<$Res> {
  factory _$$FormImplCopyWith(
          _$FormImpl value, $Res Function(_$FormImpl) then) =
      __$$FormImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, String? url});
}

/// @nodoc
class __$$FormImplCopyWithImpl<$Res>
    extends _$FormCopyWithImpl<$Res, _$FormImpl>
    implements _$$FormImplCopyWith<$Res> {
  __$$FormImplCopyWithImpl(_$FormImpl _value, $Res Function(_$FormImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? url = freezed,
  }) {
    return _then(_$FormImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FormImpl extends _Form with DiagnosticableTreeMixin {
  _$FormImpl({this.name, this.url}) : super._();

  factory _$FormImpl.fromJson(Map<String, dynamic> json) =>
      _$$FormImplFromJson(json);

  @override
  final String? name;
  @override
  final String? url;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Form(name: $name, url: $url)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Form'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('url', url));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FormImplCopyWith<_$FormImpl> get copyWith =>
      __$$FormImplCopyWithImpl<_$FormImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FormImplToJson(
      this,
    );
  }
}

abstract class _Form extends Form {
  factory _Form({final String? name, final String? url}) = _$FormImpl;
  _Form._() : super._();

  factory _Form.fromJson(Map<String, dynamic> json) = _$FormImpl.fromJson;

  @override
  String? get name;
  @override
  String? get url;
  @override
  @JsonKey(ignore: true)
  _$$FormImplCopyWith<_$FormImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Species _$SpeciesFromJson(Map<String, dynamic> json) {
  return _Species.fromJson(json);
}

/// @nodoc
mixin _$Species {
  String? get name => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SpeciesCopyWith<Species> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpeciesCopyWith<$Res> {
  factory $SpeciesCopyWith(Species value, $Res Function(Species) then) =
      _$SpeciesCopyWithImpl<$Res, Species>;
  @useResult
  $Res call({String? name, String? url});
}

/// @nodoc
class _$SpeciesCopyWithImpl<$Res, $Val extends Species>
    implements $SpeciesCopyWith<$Res> {
  _$SpeciesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? url = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SpeciesImplCopyWith<$Res> implements $SpeciesCopyWith<$Res> {
  factory _$$SpeciesImplCopyWith(
          _$SpeciesImpl value, $Res Function(_$SpeciesImpl) then) =
      __$$SpeciesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, String? url});
}

/// @nodoc
class __$$SpeciesImplCopyWithImpl<$Res>
    extends _$SpeciesCopyWithImpl<$Res, _$SpeciesImpl>
    implements _$$SpeciesImplCopyWith<$Res> {
  __$$SpeciesImplCopyWithImpl(
      _$SpeciesImpl _value, $Res Function(_$SpeciesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? url = freezed,
  }) {
    return _then(_$SpeciesImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SpeciesImpl extends _Species with DiagnosticableTreeMixin {
  _$SpeciesImpl({this.name, this.url}) : super._();

  factory _$SpeciesImpl.fromJson(Map<String, dynamic> json) =>
      _$$SpeciesImplFromJson(json);

  @override
  final String? name;
  @override
  final String? url;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Species(name: $name, url: $url)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Species'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('url', url));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpeciesImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SpeciesImplCopyWith<_$SpeciesImpl> get copyWith =>
      __$$SpeciesImplCopyWithImpl<_$SpeciesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SpeciesImplToJson(
      this,
    );
  }
}

abstract class _Species extends Species {
  factory _Species({final String? name, final String? url}) = _$SpeciesImpl;
  _Species._() : super._();

  factory _Species.fromJson(Map<String, dynamic> json) = _$SpeciesImpl.fromJson;

  @override
  String? get name;
  @override
  String? get url;
  @override
  @JsonKey(ignore: true)
  _$$SpeciesImplCopyWith<_$SpeciesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Sprites _$SpritesFromJson(Map<String, dynamic> json) {
  return _Sprites.fromJson(json);
}

/// @nodoc
mixin _$Sprites {
  Other? get other => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SpritesCopyWith<Sprites> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpritesCopyWith<$Res> {
  factory $SpritesCopyWith(Sprites value, $Res Function(Sprites) then) =
      _$SpritesCopyWithImpl<$Res, Sprites>;
  @useResult
  $Res call({Other? other});

  $OtherCopyWith<$Res>? get other;
}

/// @nodoc
class _$SpritesCopyWithImpl<$Res, $Val extends Sprites>
    implements $SpritesCopyWith<$Res> {
  _$SpritesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? other = freezed,
  }) {
    return _then(_value.copyWith(
      other: freezed == other
          ? _value.other
          : other // ignore: cast_nullable_to_non_nullable
              as Other?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OtherCopyWith<$Res>? get other {
    if (_value.other == null) {
      return null;
    }

    return $OtherCopyWith<$Res>(_value.other!, (value) {
      return _then(_value.copyWith(other: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SpritesImplCopyWith<$Res> implements $SpritesCopyWith<$Res> {
  factory _$$SpritesImplCopyWith(
          _$SpritesImpl value, $Res Function(_$SpritesImpl) then) =
      __$$SpritesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Other? other});

  @override
  $OtherCopyWith<$Res>? get other;
}

/// @nodoc
class __$$SpritesImplCopyWithImpl<$Res>
    extends _$SpritesCopyWithImpl<$Res, _$SpritesImpl>
    implements _$$SpritesImplCopyWith<$Res> {
  __$$SpritesImplCopyWithImpl(
      _$SpritesImpl _value, $Res Function(_$SpritesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? other = freezed,
  }) {
    return _then(_$SpritesImpl(
      other: freezed == other
          ? _value.other
          : other // ignore: cast_nullable_to_non_nullable
              as Other?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SpritesImpl extends _Sprites with DiagnosticableTreeMixin {
  _$SpritesImpl({this.other}) : super._();

  factory _$SpritesImpl.fromJson(Map<String, dynamic> json) =>
      _$$SpritesImplFromJson(json);

  @override
  final Other? other;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Sprites(other: $other)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Sprites'))
      ..add(DiagnosticsProperty('other', other));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpritesImpl &&
            (identical(other.other, this.other) || other.other == this.other));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, other);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SpritesImplCopyWith<_$SpritesImpl> get copyWith =>
      __$$SpritesImplCopyWithImpl<_$SpritesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SpritesImplToJson(
      this,
    );
  }
}

abstract class _Sprites extends Sprites {
  factory _Sprites({final Other? other}) = _$SpritesImpl;
  _Sprites._() : super._();

  factory _Sprites.fromJson(Map<String, dynamic> json) = _$SpritesImpl.fromJson;

  @override
  Other? get other;
  @override
  @JsonKey(ignore: true)
  _$$SpritesImplCopyWith<_$SpritesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Other _$OtherFromJson(Map<String, dynamic> json) {
  return _Other.fromJson(json);
}

/// @nodoc
mixin _$Other {
  DreamWorld? get dream_world => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OtherCopyWith<Other> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtherCopyWith<$Res> {
  factory $OtherCopyWith(Other value, $Res Function(Other) then) =
      _$OtherCopyWithImpl<$Res, Other>;
  @useResult
  $Res call({DreamWorld? dream_world});

  $DreamWorldCopyWith<$Res>? get dream_world;
}

/// @nodoc
class _$OtherCopyWithImpl<$Res, $Val extends Other>
    implements $OtherCopyWith<$Res> {
  _$OtherCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dream_world = freezed,
  }) {
    return _then(_value.copyWith(
      dream_world: freezed == dream_world
          ? _value.dream_world
          : dream_world // ignore: cast_nullable_to_non_nullable
              as DreamWorld?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DreamWorldCopyWith<$Res>? get dream_world {
    if (_value.dream_world == null) {
      return null;
    }

    return $DreamWorldCopyWith<$Res>(_value.dream_world!, (value) {
      return _then(_value.copyWith(dream_world: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OtherImplCopyWith<$Res> implements $OtherCopyWith<$Res> {
  factory _$$OtherImplCopyWith(
          _$OtherImpl value, $Res Function(_$OtherImpl) then) =
      __$$OtherImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DreamWorld? dream_world});

  @override
  $DreamWorldCopyWith<$Res>? get dream_world;
}

/// @nodoc
class __$$OtherImplCopyWithImpl<$Res>
    extends _$OtherCopyWithImpl<$Res, _$OtherImpl>
    implements _$$OtherImplCopyWith<$Res> {
  __$$OtherImplCopyWithImpl(
      _$OtherImpl _value, $Res Function(_$OtherImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dream_world = freezed,
  }) {
    return _then(_$OtherImpl(
      dream_world: freezed == dream_world
          ? _value.dream_world
          : dream_world // ignore: cast_nullable_to_non_nullable
              as DreamWorld?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OtherImpl extends _Other with DiagnosticableTreeMixin {
  _$OtherImpl({this.dream_world}) : super._();

  factory _$OtherImpl.fromJson(Map<String, dynamic> json) =>
      _$$OtherImplFromJson(json);

  @override
  final DreamWorld? dream_world;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Other(dream_world: $dream_world)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Other'))
      ..add(DiagnosticsProperty('dream_world', dream_world));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OtherImpl &&
            (identical(other.dream_world, dream_world) ||
                other.dream_world == dream_world));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, dream_world);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OtherImplCopyWith<_$OtherImpl> get copyWith =>
      __$$OtherImplCopyWithImpl<_$OtherImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OtherImplToJson(
      this,
    );
  }
}

abstract class _Other extends Other {
  factory _Other({final DreamWorld? dream_world}) = _$OtherImpl;
  _Other._() : super._();

  factory _Other.fromJson(Map<String, dynamic> json) = _$OtherImpl.fromJson;

  @override
  DreamWorld? get dream_world;
  @override
  @JsonKey(ignore: true)
  _$$OtherImplCopyWith<_$OtherImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DreamWorld _$DreamWorldFromJson(Map<String, dynamic> json) {
  return _DreamWorld.fromJson(json);
}

/// @nodoc
mixin _$DreamWorld {
  String? get front_default => throw _privateConstructorUsedError;
  String? get front_female => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DreamWorldCopyWith<DreamWorld> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DreamWorldCopyWith<$Res> {
  factory $DreamWorldCopyWith(
          DreamWorld value, $Res Function(DreamWorld) then) =
      _$DreamWorldCopyWithImpl<$Res, DreamWorld>;
  @useResult
  $Res call({String? front_default, String? front_female});
}

/// @nodoc
class _$DreamWorldCopyWithImpl<$Res, $Val extends DreamWorld>
    implements $DreamWorldCopyWith<$Res> {
  _$DreamWorldCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? front_default = freezed,
    Object? front_female = freezed,
  }) {
    return _then(_value.copyWith(
      front_default: freezed == front_default
          ? _value.front_default
          : front_default // ignore: cast_nullable_to_non_nullable
              as String?,
      front_female: freezed == front_female
          ? _value.front_female
          : front_female // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DreamWorldImplCopyWith<$Res>
    implements $DreamWorldCopyWith<$Res> {
  factory _$$DreamWorldImplCopyWith(
          _$DreamWorldImpl value, $Res Function(_$DreamWorldImpl) then) =
      __$$DreamWorldImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? front_default, String? front_female});
}

/// @nodoc
class __$$DreamWorldImplCopyWithImpl<$Res>
    extends _$DreamWorldCopyWithImpl<$Res, _$DreamWorldImpl>
    implements _$$DreamWorldImplCopyWith<$Res> {
  __$$DreamWorldImplCopyWithImpl(
      _$DreamWorldImpl _value, $Res Function(_$DreamWorldImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? front_default = freezed,
    Object? front_female = freezed,
  }) {
    return _then(_$DreamWorldImpl(
      front_default: freezed == front_default
          ? _value.front_default
          : front_default // ignore: cast_nullable_to_non_nullable
              as String?,
      front_female: freezed == front_female
          ? _value.front_female
          : front_female // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DreamWorldImpl extends _DreamWorld with DiagnosticableTreeMixin {
  _$DreamWorldImpl({this.front_default, this.front_female}) : super._();

  factory _$DreamWorldImpl.fromJson(Map<String, dynamic> json) =>
      _$$DreamWorldImplFromJson(json);

  @override
  final String? front_default;
  @override
  final String? front_female;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DreamWorld(front_default: $front_default, front_female: $front_female)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DreamWorld'))
      ..add(DiagnosticsProperty('front_default', front_default))
      ..add(DiagnosticsProperty('front_female', front_female));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DreamWorldImpl &&
            (identical(other.front_default, front_default) ||
                other.front_default == front_default) &&
            (identical(other.front_female, front_female) ||
                other.front_female == front_female));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, front_default, front_female);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DreamWorldImplCopyWith<_$DreamWorldImpl> get copyWith =>
      __$$DreamWorldImplCopyWithImpl<_$DreamWorldImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DreamWorldImplToJson(
      this,
    );
  }
}

abstract class _DreamWorld extends DreamWorld {
  factory _DreamWorld(
      {final String? front_default,
      final String? front_female}) = _$DreamWorldImpl;
  _DreamWorld._() : super._();

  factory _DreamWorld.fromJson(Map<String, dynamic> json) =
      _$DreamWorldImpl.fromJson;

  @override
  String? get front_default;
  @override
  String? get front_female;
  @override
  @JsonKey(ignore: true)
  _$$DreamWorldImplCopyWith<_$DreamWorldImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Stat _$StatFromJson(Map<String, dynamic> json) {
  return _Stat.fromJson(json);
}

/// @nodoc
mixin _$Stat {
  int? get base_stat => throw _privateConstructorUsedError;
  int? get effort => throw _privateConstructorUsedError;
  NamedAPIResource? get stat => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StatCopyWith<Stat> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatCopyWith<$Res> {
  factory $StatCopyWith(Stat value, $Res Function(Stat) then) =
      _$StatCopyWithImpl<$Res, Stat>;
  @useResult
  $Res call({int? base_stat, int? effort, NamedAPIResource? stat});

  $NamedAPIResourceCopyWith<$Res>? get stat;
}

/// @nodoc
class _$StatCopyWithImpl<$Res, $Val extends Stat>
    implements $StatCopyWith<$Res> {
  _$StatCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? base_stat = freezed,
    Object? effort = freezed,
    Object? stat = freezed,
  }) {
    return _then(_value.copyWith(
      base_stat: freezed == base_stat
          ? _value.base_stat
          : base_stat // ignore: cast_nullable_to_non_nullable
              as int?,
      effort: freezed == effort
          ? _value.effort
          : effort // ignore: cast_nullable_to_non_nullable
              as int?,
      stat: freezed == stat
          ? _value.stat
          : stat // ignore: cast_nullable_to_non_nullable
              as NamedAPIResource?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NamedAPIResourceCopyWith<$Res>? get stat {
    if (_value.stat == null) {
      return null;
    }

    return $NamedAPIResourceCopyWith<$Res>(_value.stat!, (value) {
      return _then(_value.copyWith(stat: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StatImplCopyWith<$Res> implements $StatCopyWith<$Res> {
  factory _$$StatImplCopyWith(
          _$StatImpl value, $Res Function(_$StatImpl) then) =
      __$$StatImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? base_stat, int? effort, NamedAPIResource? stat});

  @override
  $NamedAPIResourceCopyWith<$Res>? get stat;
}

/// @nodoc
class __$$StatImplCopyWithImpl<$Res>
    extends _$StatCopyWithImpl<$Res, _$StatImpl>
    implements _$$StatImplCopyWith<$Res> {
  __$$StatImplCopyWithImpl(_$StatImpl _value, $Res Function(_$StatImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? base_stat = freezed,
    Object? effort = freezed,
    Object? stat = freezed,
  }) {
    return _then(_$StatImpl(
      base_stat: freezed == base_stat
          ? _value.base_stat
          : base_stat // ignore: cast_nullable_to_non_nullable
              as int?,
      effort: freezed == effort
          ? _value.effort
          : effort // ignore: cast_nullable_to_non_nullable
              as int?,
      stat: freezed == stat
          ? _value.stat
          : stat // ignore: cast_nullable_to_non_nullable
              as NamedAPIResource?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StatImpl extends _Stat with DiagnosticableTreeMixin {
  _$StatImpl({this.base_stat, this.effort, this.stat}) : super._();

  factory _$StatImpl.fromJson(Map<String, dynamic> json) =>
      _$$StatImplFromJson(json);

  @override
  final int? base_stat;
  @override
  final int? effort;
  @override
  final NamedAPIResource? stat;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Stat(base_stat: $base_stat, effort: $effort, stat: $stat)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Stat'))
      ..add(DiagnosticsProperty('base_stat', base_stat))
      ..add(DiagnosticsProperty('effort', effort))
      ..add(DiagnosticsProperty('stat', stat));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatImpl &&
            (identical(other.base_stat, base_stat) ||
                other.base_stat == base_stat) &&
            (identical(other.effort, effort) || other.effort == effort) &&
            (identical(other.stat, stat) || other.stat == stat));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, base_stat, effort, stat);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StatImplCopyWith<_$StatImpl> get copyWith =>
      __$$StatImplCopyWithImpl<_$StatImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StatImplToJson(
      this,
    );
  }
}

abstract class _Stat extends Stat {
  factory _Stat(
      {final int? base_stat,
      final int? effort,
      final NamedAPIResource? stat}) = _$StatImpl;
  _Stat._() : super._();

  factory _Stat.fromJson(Map<String, dynamic> json) = _$StatImpl.fromJson;

  @override
  int? get base_stat;
  @override
  int? get effort;
  @override
  NamedAPIResource? get stat;
  @override
  @JsonKey(ignore: true)
  _$$StatImplCopyWith<_$StatImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Types _$TypesFromJson(Map<String, dynamic> json) {
  return _Types.fromJson(json);
}

/// @nodoc
mixin _$Types {
  int? get slot => throw _privateConstructorUsedError;
  NamedAPIResource? get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TypesCopyWith<Types> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TypesCopyWith<$Res> {
  factory $TypesCopyWith(Types value, $Res Function(Types) then) =
      _$TypesCopyWithImpl<$Res, Types>;
  @useResult
  $Res call({int? slot, NamedAPIResource? type});

  $NamedAPIResourceCopyWith<$Res>? get type;
}

/// @nodoc
class _$TypesCopyWithImpl<$Res, $Val extends Types>
    implements $TypesCopyWith<$Res> {
  _$TypesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? slot = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      slot: freezed == slot
          ? _value.slot
          : slot // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NamedAPIResource?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NamedAPIResourceCopyWith<$Res>? get type {
    if (_value.type == null) {
      return null;
    }

    return $NamedAPIResourceCopyWith<$Res>(_value.type!, (value) {
      return _then(_value.copyWith(type: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TypesImplCopyWith<$Res> implements $TypesCopyWith<$Res> {
  factory _$$TypesImplCopyWith(
          _$TypesImpl value, $Res Function(_$TypesImpl) then) =
      __$$TypesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? slot, NamedAPIResource? type});

  @override
  $NamedAPIResourceCopyWith<$Res>? get type;
}

/// @nodoc
class __$$TypesImplCopyWithImpl<$Res>
    extends _$TypesCopyWithImpl<$Res, _$TypesImpl>
    implements _$$TypesImplCopyWith<$Res> {
  __$$TypesImplCopyWithImpl(
      _$TypesImpl _value, $Res Function(_$TypesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? slot = freezed,
    Object? type = freezed,
  }) {
    return _then(_$TypesImpl(
      slot: freezed == slot
          ? _value.slot
          : slot // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NamedAPIResource?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TypesImpl extends _Types with DiagnosticableTreeMixin {
  _$TypesImpl({this.slot, this.type}) : super._();

  factory _$TypesImpl.fromJson(Map<String, dynamic> json) =>
      _$$TypesImplFromJson(json);

  @override
  final int? slot;
  @override
  final NamedAPIResource? type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Types(slot: $slot, type: $type)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Types'))
      ..add(DiagnosticsProperty('slot', slot))
      ..add(DiagnosticsProperty('type', type));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TypesImpl &&
            (identical(other.slot, slot) || other.slot == slot) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, slot, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TypesImplCopyWith<_$TypesImpl> get copyWith =>
      __$$TypesImplCopyWithImpl<_$TypesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TypesImplToJson(
      this,
    );
  }
}

abstract class _Types extends Types {
  factory _Types({final int? slot, final NamedAPIResource? type}) = _$TypesImpl;
  _Types._() : super._();

  factory _Types.fromJson(Map<String, dynamic> json) = _$TypesImpl.fromJson;

  @override
  int? get slot;
  @override
  NamedAPIResource? get type;
  @override
  @JsonKey(ignore: true)
  _$$TypesImplCopyWith<_$TypesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
