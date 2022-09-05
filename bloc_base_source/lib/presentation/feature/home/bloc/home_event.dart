import '../../../../core/bloc/event.dart';

abstract class HomeEvent extends BaseEvent {
  @override
  List<Object?> get props => [];
}

class TapNavigationPage extends HomeEvent {
  TapNavigationPage(this.indexPage);

  final int indexPage;

  @override
  List<Object> get props => [indexPage];
}

class TapScreen extends HomeEvent {}

class DoubleTapScreen extends HomeEvent {}
