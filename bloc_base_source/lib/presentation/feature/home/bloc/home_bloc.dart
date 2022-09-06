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
    } else if (event is DoubleTapScreenEvent) {}
  }
}
