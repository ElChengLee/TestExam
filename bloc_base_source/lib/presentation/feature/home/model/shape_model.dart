import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class ShapeModel extends Equatable {}

class CircleModel extends ShapeModel {
  Color? color;
  int diameter;
  Offset? offset;

  CircleModel({this.color, this.diameter = 0, this.offset});

  @override
  List<Object?> get props => [color, diameter, offset];
}
