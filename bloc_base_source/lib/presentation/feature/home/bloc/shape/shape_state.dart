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

class SquareTapState extends ShapeState {
  const SquareTapState(List<SquareModel> listModel) : super(listModel);
}

class CircleTapState extends ShapeState {
  const CircleTapState(List<CircleModel> listModel) : super(listModel);
}

class TriangleTapState extends ShapeState {
  const TriangleTapState(List<TriangleModel> listModel) : super(listModel);
}

class AllTapState extends ShapeState {
  const AllTapState(List<TriangleModel> listModel) : super(listModel);
}
