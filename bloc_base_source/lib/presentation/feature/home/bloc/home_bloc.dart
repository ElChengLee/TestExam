import 'package:bloc_base_source/core/bloc/event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/bloc/base_bloc.dart';
import '../../../../core/bloc/state.dart';
import '../remote/repository/home_repository.dart';
import 'home_event.dart';

class HomeBloc extends BaseBloc {
  final HomeRepository _repository;
  int currentIndex = 0;

  HomeBloc(this._repository) : super(const InitialState());

  @override
  Future<void> handleEvent(BaseEvent event, Emitter<BaseState> emit) async {
      if (event is TapNavigationPage) {
        currentIndex = event.indexPage;
      } else if (event is TapScreen) {

      } else if (event is DoubleTapScreen) {

      }
  }
}
