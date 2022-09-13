import 'package:freezed_annotation/freezed_annotation.dart';

part 'shape_model.freezed.dart';

abstract class ShapeModel {}

@freezed
class CircleModel extends ShapeModel with _$CircleModel {
  factory CircleModel({String? colorHex, int? diameter, double? dx, double? dy}) =
      _CircleModel;
}

@freezed
class SquareModel extends ShapeModel with _$SquareModel {
  factory SquareModel({String? colorHex, int? dimen, double? dx, double? dy}) =
      _SquareModel;
}

@freezed
class TriangleModel extends ShapeModel with _$TriangleModel {
  factory TriangleModel({String? colorHex, int? width, int? height, double? dx, double? dy}) =
      _TriangleModel;
}
