import 'dart:math';

import 'package:bloc_base_source/core/bloc/state.dart';
import 'package:flutter/material.dart';

import '../../../../core/widget/view/custom_painter.dart';
import '../../../util/color_util.dart';
import '../../../util/utils.dart';
import '../bloc/shape/shape_state.dart';
import '../model/bottom_navi_item.dart';
import '../model/shape_model.dart';
import 'shape/shape_screen.dart';

class AllShapeView extends ShapeScreen {
  @override
  bool rebuildViewWhen(BaseState previous, BaseState current) {
    return current is AllTapState;
  }

  @override
  BottomNaviItem get bottomNaviItem => BottomNaviItem.All;

  @override
  List<Widget> listWidget(ShapeState shapeState) {
    List<Widget> list = List.empty(growable: true);
    for (var element in shapeState.listModel) {
      if (element is CircleModel) {
        list.add(CustomPaint(
          painter: CirclePainter(
            color: HexColor.fromHex(element.colorHex),
            offset: Offset(element.dx ?? 0, element.dy ?? 0),
            diameter: element.diameter,
          ),
        ));
      } else if (element is SquaresModel) {
        list.add(CustomPaint(
          painter: SquaresPainter(
            color: HexColor.fromHex(element.colorHex),
            offset: Offset(element.dx ?? 0, element.dy ?? 0),
            dimension: element.dimen?.toDouble() ?? 0,
          ),
        ));
      } else if (element is TriangleModel) {
        list.add(CustomPaint(
          painter: TrianglePainter(
            color: HexColor.fromHex(element.colorHex),
            offset: Offset(element.dx ?? 0, element.dy ?? 0),
            height: element.height?.toDouble() ?? 0,
            width: element.height?.toDouble() ?? 0,
          ),
        ));
      }
    }
    return list;
  }

  @override
  ShapeModel getShapeModel(BuildContext context, Offset offset) {
    Random random = Random();
    int index = random.nextInt(BottomNaviItem.values.length - 1);
    if (BottomNaviItem.values[index] == BottomNaviItem.Squares) {
      return SquaresModel(
        dx: offset.dx,
        dy: offset.dy,
        dimen: Utils.getRandomDimenSize(context),
      );
    } else if (BottomNaviItem.values[index] == BottomNaviItem.Circle) {
      return CircleModel(
        dx: offset.dx,
        dy: offset.dy,
        diameter: Utils.getRandomDimenSize(context),
      );
    } else {
      return SquaresModel(
        dx: offset.dx,
        dy: offset.dy,
        dimen: Utils.getRandomDimenSize(context),
      );
    }
  }
}
