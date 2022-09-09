import '../../../../../core/bloc/event.dart';
import '../../model/bottom_navi_item.dart';
import '../../model/shape_model.dart';

abstract class NavigationEvent extends BaseEvent {
  @override
  List<Object?> get props => [];
}

class TapNaviEvent extends NavigationEvent {
  TapNaviEvent(this.index);

  final int index;

  @override
  List<Object> get props => [index];
}