import 'package:json_annotation/json_annotation.dart';

part 'model_base_response.g.dart';

const String successStatus = "0";
const String parseError = "-1";
const String timeOut = "-2";
const String unknownError = "-99";
const String tokenExprired = "401";

@JsonSerializable(explicitToJson: true, genericArgumentFactories: true)
class ModelBaseResponse<T> {
  final T? data;

  ModelBaseResponse(this.data);

  factory ModelBaseResponse.fromJson(
      Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$ModelBaseResponseFromJson<T>(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T) toJsonT) =>
      _$ModelBaseResponseToJson<T>(this, toJsonT);
}