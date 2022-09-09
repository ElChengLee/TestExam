import 'package:bloc_base_source/core/bloc/state.dart';
import 'package:bloc_base_source/presentation/feature/home/model/shape_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/bloc/base_bloc.dart';
import '../../model/bottom_navi_item.dart';
import 'navigation_event.dart';
import 'navigation_state.dart';

class NavigationBloc extends BaseBloc<NavigationEvent, BaseState> {
  NavigationBloc() : super(BottomNaviState());

  List<CircleModel> listCircle = List.empty(growable: true);

  @override
  Future<void> handleEvent(
      NavigationEvent event, Emitter<BaseState> emit) async {
    if (event is TapNaviEvent) {
      emit.call((BottomNaviItem.values[event.index]).naviState);
    }
  }
}
