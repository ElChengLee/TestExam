// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_base_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelBaseResponse<T> _$ModelBaseResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    ModelBaseResponse<T>(
      _$nullableGenericFromJson(json['data'], fromJsonT),
    );

Map<String, dynamic> _$ModelBaseResponseToJson<T>(
  ModelBaseResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'data': _$nullableGenericToJson(instance.data, toJsonT),
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
