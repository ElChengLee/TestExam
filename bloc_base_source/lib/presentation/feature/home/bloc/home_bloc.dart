import 'package:flutter_bloc/flutter_bloc.dart';

import 'bottom_navi_state.dart';
import 'home_event.dart';

class HomeBloc extends Bloc<TapNavigationPage, BottomNaviState> {
  HomeBloc() : super(SquareNaviState()) {
    on((event, emit) => {
      emit.call(state)
    });
  }
}
