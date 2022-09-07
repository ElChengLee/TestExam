import 'package:bloc_base_source/core/bloc/state.dart';

import '../model/shape_model.dart';

abstract class HomeState extends BaseState {}

class BottomNaviState extends HomeState {
  final int index;

  BottomNaviState({this.index = 0});

  @override
  List<Object?> get props => [index];
}

class SquareTapState extends HomeState {
  @override
  List<Object?> get props => [];
}

class CircleTapState extends HomeState {
  final List<CircleModel> listModel;

  CircleTapState(this.listModel);

  @override
  List<Object?> get props => [listModel];
}

class TriangleNaviState extends HomeState {
  @override
  List<Object?> get props => [];
}
