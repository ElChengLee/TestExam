import 'package:flutter/cupertino.dart';

import '../../../../core/bloc/event.dart';
import '../model/bottom_navi_item.dart';

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
  TapScreenEvent(this.item, this.offset);

  final BottomNaviItem item;
  final Offset offset;

  @override
  List<Object> get props => [item, offset];
}

class DoubleTapScreenEvent extends HomeEvent {
  DoubleTapScreenEvent(this.item, this.offset);

  final BottomNaviItem item;
  final Offset offset;

  @override
  List<Object> get props => [item, offset];
}
