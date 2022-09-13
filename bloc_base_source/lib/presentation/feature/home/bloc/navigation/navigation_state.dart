import '../../../../../core/bloc/state.dart';
import '../../model/shape_model.dart';

abstract class NavigationState extends BaseState {}

class BottomNaviState extends NavigationState {
  final int index;

  BottomNaviState({this.index = 0});

  @override
  List<Object?> get props => [index];
}

 class ShapeTapState extends NavigationState {
  final List<ShapeModel> listModel;

  ShapeTapState(this.listModel);

  @override
  List<Object?> get props => [listModel];
}
