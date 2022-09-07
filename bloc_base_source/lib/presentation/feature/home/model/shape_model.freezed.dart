// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'shape_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CircleModel {
  String? get colorHex => throw _privateConstructorUsedError;
  int? get diameter => throw _privateConstructorUsedError;
  double? get dx => throw _privateConstructorUsedError;
  double? get dy => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CircleModelCopyWith<CircleModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CircleModelCopyWith<$Res> {
  factory $CircleModelCopyWith(
          CircleModel value, $Res Function(CircleModel) then) =
      _$CircleModelCopyWithImpl<$Res>;
  $Res call({String? colorHex, int? diameter, double? dx, double? dy});
}

/// @nodoc
class _$CircleModelCopyWithImpl<$Res> implements $CircleModelCopyWith<$Res> {
  _$CircleModelCopyWithImpl(this._value, this._then);

  final CircleModel _value;
  // ignore: unused_field
  final $Res Function(CircleModel) _then;

  @override
  $Res call({
    Object? colorHex = freezed,
    Object? diameter = freezed,
    Object? dx = freezed,
    Object? dy = freezed,
  }) {
    return _then(_value.copyWith(
      colorHex: colorHex == freezed
          ? _value.colorHex
          : colorHex // ignore: cast_nullable_to_non_nullable
              as String?,
      diameter: diameter == freezed
          ? _value.diameter
          : diameter // ignore: cast_nullable_to_non_nullable
              as int?,
      dx: dx == freezed
          ? _value.dx
          : dx // ignore: cast_nullable_to_non_nullable
              as double?,
      dy: dy == freezed
          ? _value.dy
          : dy // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
abstract class _$$_CircleModelCopyWith<$Res>
    implements $CircleModelCopyWith<$Res> {
  factory _$$_CircleModelCopyWith(
          _$_CircleModel value, $Res Function(_$_CircleModel) then) =
      __$$_CircleModelCopyWithImpl<$Res>;
  @override
  $Res call({String? colorHex, int? diameter, double? dx, double? dy});
}

/// @nodoc
class __$$_CircleModelCopyWithImpl<$Res> extends _$CircleModelCopyWithImpl<$Res>
    implements _$$_CircleModelCopyWith<$Res> {
  __$$_CircleModelCopyWithImpl(
      _$_CircleModel _value, $Res Function(_$_CircleModel) _then)
      : super(_value, (v) => _then(v as _$_CircleModel));

  @override
  _$_CircleModel get _value => super._value as _$_CircleModel;

  @override
  $Res call({
    Object? colorHex = freezed,
    Object? diameter = freezed,
    Object? dx = freezed,
    Object? dy = freezed,
  }) {
    return _then(_$_CircleModel(
      colorHex: colorHex == freezed
          ? _value.colorHex
          : colorHex // ignore: cast_nullable_to_non_nullable
              as String?,
      diameter: diameter == freezed
          ? _value.diameter
          : diameter // ignore: cast_nullable_to_non_nullable
              as int?,
      dx: dx == freezed
          ? _value.dx
          : dx // ignore: cast_nullable_to_non_nullable
              as double?,
      dy: dy == freezed
          ? _value.dy
          : dy // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

class _$_CircleModel implements _CircleModel {
  _$_CircleModel({this.colorHex, this.diameter, this.dx, this.dy});

  @override
  final String? colorHex;
  @override
  final int? diameter;
  @override
  final double? dx;
  @override
  final double? dy;

  @override
  String toString() {
    return 'CircleModel(colorHex: $colorHex, diameter: $diameter, dx: $dx, dy: $dy)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CircleModel &&
            const DeepCollectionEquality().equals(other.colorHex, colorHex) &&
            const DeepCollectionEquality().equals(other.diameter, diameter) &&
            const DeepCollectionEquality().equals(other.dx, dx) &&
            const DeepCollectionEquality().equals(other.dy, dy));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(colorHex),
      const DeepCollectionEquality().hash(diameter),
      const DeepCollectionEquality().hash(dx),
      const DeepCollectionEquality().hash(dy));

  @JsonKey(ignore: true)
  @override
  _$$_CircleModelCopyWith<_$_CircleModel> get copyWith =>
      __$$_CircleModelCopyWithImpl<_$_CircleModel>(this, _$identity);
}

abstract class _CircleModel implements CircleModel {
  factory _CircleModel(
      {final String? colorHex,
      final int? diameter,
      final double? dx,
      final double? dy}) = _$_CircleModel;

  @override
  String? get colorHex;
  @override
  int? get diameter;
  @override
  double? get dx;
  @override
  double? get dy;
  @override
  @JsonKey(ignore: true)
  _$$_CircleModelCopyWith<_$_CircleModel> get copyWith =>
      throw _privateConstructorUsedError;
}
