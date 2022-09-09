import '../../../../../core/bloc/event.dart';
import '../../model/bottom_navi_item.dart';
import '../../model/shape_model.dart';

abstract class ShapeEvent extends BaseEvent {
  @override
  List<Object?> get props => [];
}

class TapScreenEvent extends ShapeEvent {
  TapScreenEvent(this.item, this.model);

  final BottomNaviItem item;
  final ShapeModel model;

  @override
  List<Object> get props => [item, model];
}

class DoubleTapScreenEvent extends ShapeEvent {
  DoubleTapScreenEvent(this.item, this.model);

  final BottomNaviItem item;
  final ShapeModel model;

  @override
  List<Object> get props => [item, model];
}
