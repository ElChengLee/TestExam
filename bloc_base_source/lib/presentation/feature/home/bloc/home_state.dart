import 'package:bloc_base_source/core/bloc/state.dart';
import 'package:flutter/material.dart';

abstract class HomeState extends BaseState {}

@immutable
abstract class BottomNaviState extends HomeState {
  String get title;

  @override
  List<Object?> get props => [title];
}

class SquareNaviState extends BottomNaviState {
  @override
  final String title = "Square";
}

class CircleNaviState extends BottomNaviState {
  @override
  final String title = "Circle";
}

class TriangleNaviState extends BottomNaviState {
  @override
  final String title = "Triangle";
}

class AllNaviState extends BottomNaviState {
  @override
  final String title = "All";
}
