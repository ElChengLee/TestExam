import 'package:freezed_annotation/freezed_annotation.dart';

part 'shape_model.freezed.dart';

abstract class ShapeModel {}

@freezed
class CircleModel extends ShapeModel with _$CircleModel {
  factory CircleModel({String? colorHex, int? diameter, double? dx, double? dy}) =
      _CircleModel;
}
