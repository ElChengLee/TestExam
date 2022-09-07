import 'dart:math';

import 'package:bloc_base_source/core/bloc/state.dart';
import 'package:bloc_base_source/presentation/feature/home/model/color_model.dart';
import 'package:bloc_base_source/presentation/feature/home/model/shape_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/bloc/base_bloc.dart';
import '../../../util/hex_color.dart';
import '../model/bottom_navi_item.dart';
import '../remote/repository/home_repository.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends BaseBloc<HomeEvent, BaseState> {
  final HomeRepository _repository;

  HomeBloc(this._repository) : super(BottomNaviState());

  List<CircleModel> listCircle = List.empty(growable: true);

  @override
  Future<void> handleEvent(HomeEvent event, Emitter<BaseState> emit) async {
    if (event is TapNaviEvent) {
      emit.call((BottomNaviItem.values[event.index]).naviState);
    } else if (event is TapScreenEvent) {
      switch (event.item) {
        case BottomNaviItem.Circle:
          await tapCircleShape(event.model, emit);
          break;
        case BottomNaviItem.Triangle:
          tapTriangleShape(event.model, emit);
          break;
        case BottomNaviItem.All:
          tapAllShape(event.model, emit);
          break;
        default:
          tapSquareShape(event.model, emit);
          break;
      }
    } else if (event is DoubleTapScreenEvent) {
      switch (event.item) {
        case BottomNaviItem.Circle:
          doubleTapCircleShape(event.model, emit);
          break;
        case BottomNaviItem.Triangle:
          doubleTapTriangleShape(event.model, emit);
          break;
        case BottomNaviItem.All:
          doubleTapAllShape(event.model, emit);
          break;
        default:
          doubleTapSquareShape(event.model, emit);
          break;
      }
    }
  }

  void tapSquareShape(ShapeModel model, Emitter<BaseState> emit) {}

  tapCircleShape(ShapeModel model, Emitter<BaseState> emit) async {
    CircleModel circleModel = model as CircleModel;
    await safeDataCall(
        callToHost: _repository.loadColorRandom(),
        loading: () => emit.call(LoadingDialogState()),
        error: (message) {
          listCircle.add(CircleModel(
              offset: circleModel.offset,
              diameter: model.diameter,
              color: loadColorRandomLocal()));
          emit.call(CircleTapState(listCircle));
        },
        success: (List<ColorModel>? data) {
          Color color = data?.isNotEmpty == true
              ? HexColor.fromHex(data!.first.hex)
              : loadColorRandomLocal();
          listCircle.add(CircleModel(
              offset: circleModel.offset,
              diameter: model.diameter,
              color: color));
          emit.call(CircleTapState(listCircle));
        });
  }

  Color loadColorRandomLocal() =>
      Colors.primaries[Random().nextInt(Colors.primaries.length)];

  void tapTriangleShape(ShapeModel model, Emitter<BaseState> emit) {}

  void tapAllShape(ShapeModel model, Emitter<BaseState> emit) {}

  void doubleTapSquareShape(ShapeModel model, Emitter<BaseState> emit) {}

  void doubleTapCircleShape(ShapeModel model, Emitter<BaseState> emit) {}

  void doubleTapTriangleShape(ShapeModel model, Emitter<BaseState> emit) {}

  void doubleTapAllShape(ShapeModel model, Emitter<BaseState> emit) {}
}
