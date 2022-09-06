import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/bloc/base_bloc.dart';
import '../model/bottom_navi_item.dart';
import '../remote/repository/home_repository.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends BaseBloc<HomeEvent, HomeState> {
  final HomeRepository _repository;

  HomeBloc(this._repository) : super(SquareNaviState());

  @override
  Future<void> handleEvent(HomeEvent event, Emitter<HomeState> emit) async {
    if (event is TapNaviEvent) {
      emit.call((BottomNaviItem.values[event.index]).naviState);
    } else if (event is TapScreenEvent) {
      switch (event.item) {
        case BottomNaviItem.Circle:
          tapCircleShape(event.offset, emit);
          break;
        case BottomNaviItem.Triangle:
          tapTriangleShape(event.offset, emit);
          break;
        case BottomNaviItem.All:
          tapAllShape(event.offset, emit);
          break;
        default:
          tapSquareShape(event.offset, emit);
          break;
      }
    } else if (event is DoubleTapScreenEvent) {
      switch (event.item) {
        case BottomNaviItem.Circle:
          doubleTapCircleShape(event.offset, emit);
          break;
        case BottomNaviItem.Triangle:
          doubleTapTriangleShape(event.offset, emit);
          break;
        case BottomNaviItem.All:
          doubleTapAllShape(event.offset, emit);
          break;
        default:
          doubleTapSquareShape(event.offset, emit);
          break;
      }
    }
  }

  void tapSquareShape(Offset offset, Emitter<HomeState> emit) {}

  void tapCircleShape(Offset offset, Emitter<HomeState> emit) {}

  void tapTriangleShape(Offset offset, Emitter<HomeState> emit) {}

  void tapAllShape(Offset offset, Emitter<HomeState> emit) {}

  void doubleTapSquareShape(Offset offset, Emitter<HomeState> emit) {}

  void doubleTapCircleShape(Offset offset, Emitter<HomeState> emit) {}

  void doubleTapTriangleShape(Offset offset, Emitter<HomeState> emit) {}

  void doubleTapAllShape(Offset offset, Emitter<HomeState> emit) {}
}
