import '../../../../../core/bloc/state.dart';
import '../../model/shape_model.dart';

abstract class ShapeState extends BaseState {
  final List<ShapeModel> listModel;

  const ShapeState(this.listModel);

  @override
  List<Object?> get props => [listModel];
}

class InitialShapeState extends ShapeState {
  const InitialShapeState(List<ShapeModel> listModel) : super(listModel);
}

abstract class ShapeTapState extends ShapeState {
  const ShapeTapState(List<ShapeModel> listModel) : super(listModel);
}

class SquareTapState extends ShapeTapState {
  const SquareTapState(List<ShapeModel> listModel) : super(listModel);

  @override
  List<Object?> get props => [];
}

class CircleTapState extends ShapeTapState {
  const CircleTapState(List<ShapeModel> listModel) : super(listModel);

  @override
  List<Object?> get props => [listModel];
}

abstract class ShapeDoubleTapState extends ShapeState {
  const ShapeDoubleTapState(List<ShapeModel> listModel) : super(listModel);
}

class TriangleNaviState extends ShapeDoubleTapState {
  const TriangleNaviState(List<ShapeModel> listModel) : super(listModel);

  @override
  List<Object?> get props => [];
}
