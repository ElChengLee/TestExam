import '../../../../core/bloc/event.dart';
import '../model/bottom_navi_item.dart';
import '../model/shape_model.dart';

abstract class HomeEvent extends BaseEvent {
  @override
  List<Object?> get props => [];
}

class TapNaviEvent extends HomeEvent {
  TapNaviEvent(this.index);

  final int index;

  @override
  List<Object> get props => [index];
}

class TapScreenEvent extends HomeEvent {
  TapScreenEvent(this.item, this.model);

  final BottomNaviItem item;
  final ShapeModel model;

  @override
  List<Object> get props => [item, model];
}

class DoubleTapScreenEvent extends HomeEvent {
  DoubleTapScreenEvent(this.item, this.model);

  final BottomNaviItem item;
  final ShapeModel model;

  @override
  List<Object> get props => [item, model];
}
