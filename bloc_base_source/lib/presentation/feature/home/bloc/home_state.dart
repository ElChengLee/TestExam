import 'package:bloc_base_source/core/bloc/state.dart';

import '../model/shape_model.dart';

abstract class HomeState extends BaseState {}

class BottomNaviState extends HomeState {
  final int index;

  BottomNaviState({this.index = 0});

  @override
  List<Object?> get props => [index];
}

abstract class ShapeTapState extends HomeState {}

class SquareTapState extends ShapeTapState {
  @override
  List<Object?> get props => [];
}

class CircleTapState extends ShapeTapState {
  final List<CircleModel> listModel;

  CircleTapState(this.listModel);

  @override
  List<Object?> get props => [listModel];
}

abstract class ShapeDoubleTapState extends HomeState {}

class TriangleNaviState extends ShapeDoubleTapState {
  @override
  List<Object?> get props => [];
}
