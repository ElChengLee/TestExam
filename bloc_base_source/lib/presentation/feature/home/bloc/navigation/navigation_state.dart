import '../../../../../core/bloc/state.dart';
import '../../model/shape_model.dart';

abstract class NavigationState extends BaseState {}

class BottomNaviState extends NavigationState {
  final int index;

  BottomNaviState({this.index = 0});

  @override
  List<Object?> get props => [index];
}

abstract class ShapeTapState extends NavigationState {}

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

abstract class ShapeDoubleTapState extends NavigationState {}

class TriangleNaviState extends ShapeDoubleTapState {
  @override
  List<Object?> get props => [];
}
