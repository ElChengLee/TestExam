import 'package:bloc_base_source/core/bloc/state.dart';
import 'package:bloc_base_source/presentation/feature/home/bloc/shape/shape_state.dart';
import 'package:bloc_base_source/presentation/feature/home/view/shape/shape_screen.dart';
import 'package:flutter/material.dart';

import '../../../../core/widget/view/custom_painter.dart';
import '../../../util/color_util.dart';
import '../../../util/utils.dart';
import '../model/bottom_navi_item.dart';
import '../model/shape_model.dart';

class TriangleShapeView extends ShapeScreen {
  TriangleShapeView({Key? key}) : super(key: key);

  @override
  bool rebuildViewWhen(BaseState previous, BaseState current) {
    return current is TriangleTapState;
  }

  @override
  BottomNaviItem get bottomNaviItem => BottomNaviItem.Triangle;

  @override
  List<Widget> listWidget(ShapeState shapeState) {
    List<Widget> list = List.empty(growable: true);
    for (var element in shapeState.listModel) {
      element as TriangleModel;
      list.add(CustomPaint(
        painter: TrianglePainter(
          color: HexColor.fromHex(element.colorHex),
          offset: Offset(element.dx ?? 0, element.dy ?? 0),
          height: element.height?.toDouble() ?? 0,
          width: element.height?.toDouble() ?? 0,
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
