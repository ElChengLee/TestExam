import 'dart:math';

import 'package:bloc_base_source/core/bloc/state.dart';
import 'package:bloc_base_source/presentation/feature/home/bloc/shape/shape_event.dart';
import 'package:bloc_base_source/presentation/feature/home/bloc/shape/shape_state.dart';
import 'package:bloc_base_source/presentation/feature/home/model/shape_model.dart';
import 'package:bloc_base_source/presentation/util/color_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/bloc/base_bloc.dart';
import '../../model/bottom_navi_item.dart';
import '../../model/color_model.dart';
import '../../remote/repository/home_repository.dart';

class ShapeBloc extends BaseBloc<ShapeEvent, BaseState> {
  final HomeRepository _repository;

  ShapeBloc(this._repository) : super(InitialShapeState(List.empty()));

  List<ShapeModel> listAll = List.empty(growable: true);

  List<TriangleModel> listTriangle = List.empty(growable: true);

  List<CircleModel> listCircle = List.empty(growable: true);

  List<SquaresModel> listSquares = List.empty(growable: true);

  @override
  Future<void> handleEvent(ShapeEvent event, Emitter<BaseState> emit) async {
    if (event is TapScreenEvent) {
      switch (event.item) {
        case BottomNaviItem.Circle:
          await tapCircleShape(event.model, emit, response: (model) {
            listCircle.add(model as CircleModel);
            emit.call(CircleTapState(listCircle));
          });
          break;
        case BottomNaviItem.Triangle:
          await tapTriangleShape(event.model, emit, response: (model) {
            listTriangle.add(model as TriangleModel);
            emit.call(TriangleTapState(listTriangle));
          });
          break;
        case BottomNaviItem.All:
          await tapAllShape(event.model, emit, response: (model) {
            listAll.add(model);
            emit.call(AllTapState(listAll));
          });
          break;
        default:
          await tapSquaresShape(event.model, emit, response: (model) {
            listSquares.add(model as SquaresModel);
            emit.call(SquaresTapState(listSquares));
          });
          break;
      }
    } else if (event is DoubleTapScreenEvent) {
      switch (event.item) {
        case BottomNaviItem.Circle:
          await doubleTapCircleShape(event.model, emit);
          break;
        case BottomNaviItem.Triangle:
          doubleTapTriangleShape(event.model, emit);
          break;
        case BottomNaviItem.All:
          doubleTapAllShape(event.model, emit);
          break;
        default:
          doubleTapSquaresShape(event.model, emit);
          break;
      }
    }
  }

  tapSquaresShape(ShapeModel model, Emitter<BaseState> emit,
      {Function(ShapeModel)? response}) async {
    model as SquaresModel;
    await safeDataCall(
        callToHost: _repository.loadColorRandom(),
        loading: () => emit.call(LoadingDialogState()),
        error: (message) {
          hideDialogState();
          response?.call(model.copyWith(colorHex: loadColorRandomLocal()));
        },
        success: (List<ColorModel>? data) {
          String color = data?.isNotEmpty == true
              ? data!.first.hex
              : loadColorRandomLocal();
          hideDialogState();
          response?.call(model.copyWith(colorHex: color));
        });
  }

  tapCircleShape(ShapeModel model, Emitter<BaseState> emit,
      {Function(ShapeModel)? response}) async {
    model as CircleModel;
    await safeDataCall(
        callToHost: _repository.loadColorRandom(),
        loading: () => emit.call(LoadingDialogState()),
        error: (message) {
          hideDialogState();
          response?.call(model.copyWith(colorHex: loadColorRandomLocal()));
        },
        success: (List<ColorModel>? data) {
          String color = data?.isNotEmpty == true
              ? data!.first.hex
              : loadColorRandomLocal();
          hideDialogState();
          response?.call(model.copyWith(colorHex: color));
        });
  }

  String loadColorRandomLocal() =>
      Colors.primaries[Random().nextInt(Colors.primaries.length)].toHex();

  tapTriangleShape(ShapeModel model, Emitter<BaseState> emit,
      {Function(ShapeModel)? response}) async {
    model as TriangleModel;
    await safeDataCall(
        callToHost: _repository.loadColorRandom(),
        loading: () => emit.call(LoadingDialogState()),
        error: (message) {
          hideDialogState();
          response?.call(model.copyWith(colorHex: loadColorRandomLocal()));
        },
        success: (List<ColorModel>? data) {
          String color = data?.isNotEmpty == true
              ? data!.first.hex
              : loadColorRandomLocal();
          hideDialogState();
          response?.call(model.copyWith(colorHex: color));
        });
  }

  tapAllShape(ShapeModel model, Emitter<BaseState> emit,
      {Function(ShapeModel)? response}) async {
    if (model is CircleModel) {
      await tapCircleShape(model, emit, response: response);
    } else if (model is TriangleModel) {
      await tapTriangleShape(model, emit, response: response);
    } else {
      await tapSquaresShape(model, emit, response: response);
    }
  }

  void doubleTapSquaresShape(ShapeModel model, Emitter<BaseState> emit) {}

  doubleTapCircleShape(ShapeModel pointModel, Emitter<BaseState> emit) async {
    pointModel as CircleModel;
    for (int i = listCircle.length - 1; i >= 0; i--) {
      CircleModel model = listCircle[i];

      if (invalidPointCoordinatesInCircle(
              pointModel.dx ?? 0, model.dx ?? 0, (model.diameter ?? 0) / 2) &&
          invalidPointCoordinatesInCircle(
              pointModel.dy ?? 0, model.dy ?? 0, (model.diameter ?? 0) / 2)) {
        await safeDataCall(
            callToHost: _repository.loadColorRandom(),
            loading: () => emit.call(LoadingDialogState()),
            error: (message) {
              listCircle[i] = model.copyWith(colorHex: loadColorRandomLocal());
              hideDialogState();
              emit.call(CircleTapState(listCircle));
            },
            success: (List<ColorModel>? data) {
              String color = data?.isNotEmpty == true
                  ? data!.first.hex
                  : loadColorRandomLocal();
              listCircle[i] = model.copyWith(colorHex: color);
              hideDialogState();
              emit.call(CircleTapState(listCircle));
            });
        break;
      }
    }
  }

  bool invalidPointCoordinatesInCircle(
      double pointOffset, double shapeOffset, num shapeDimen) {
    return pointOffset <= (shapeOffset + shapeDimen) &&
        pointOffset >= (shapeOffset - shapeDimen);
  }

  void doubleTapTriangleShape(ShapeModel model, Emitter<BaseState> emit) {}

  void doubleTapAllShape(ShapeModel model, Emitter<BaseState> emit) {}
}
