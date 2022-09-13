import 'package:bloc_base_source/core/bloc/state.dart';
import 'package:flutter/material.dart';

import '../../../../core/widget/view/custom_painter.dart';
import '../../../util/color_util.dart';
import '../../../util/utils.dart';
import '../bloc/shape/shape_state.dart';
import '../model/bottom_navi_item.dart';
import '../model/shape_model.dart';
import 'shape/shape_screen.dart';

class SquareShapeView extends ShapeScreen {
  @override
  bool rebuildViewWhen(BaseState previous, BaseState current) {
    return current is SquareTapState;
  }

  @override
  BottomNaviItem get bottomNaviItem => BottomNaviItem.Square;

  @override
  List<Widget> listWidget(ShapeState shapeState) {
    List<Widget> list = List.empty(growable: true);
    for (var element in shapeState.listModel) {
      element as SquareModel;
      list.add(CustomPaint(
        painter: SquaresPainter(
          color: HexColor.fromHex(element.colorHex),
          offset: Offset(element.dx ?? 0, element.dy ?? 0),
          dimension: element.dimen?.toDouble() ?? 0,
        ),
      ));
    }
    return list;
  }

  @override
  ShapeModel getShapeModel(BuildContext context, Offset offset) => SquareModel(
        dx: offset.dx,
        dy: offset.dy,
        dimen: Utils.getRandomDimenSize(context),
      );
}
