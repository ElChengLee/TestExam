import '../../../../core/bloc/event.dart';

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

class TapScreenEvent extends HomeEvent {}

class DoubleTapScreenEvent extends HomeEvent {}
