import 'package:bloc_base_source/core/bloc/state.dart';
import 'package:bloc_base_source/presentation/feature/home/bloc/shape/shape_state.dart';
import 'package:bloc_base_source/presentation/feature/home/model/bottom_navi_item.dart';
import 'package:bloc_base_source/presentation/feature/home/model/shape_model.dart';
import 'package:bloc_base_source/presentation/util/color_util.dart';
import 'package:flutter/material.dart';

import '../../../../core/widget/view/custom_painter.dart';
import '../../../util/utils.dart';
import 'shape/shape_screen.dart';

class CircleShapeView extends ShapeScreen {
  CircleShapeView({Key? key}) : super(key: key);

  @override
  bool rebuildViewWhen(BaseState previous, BaseState current) {
    return current is CircleTapState;
  }

  @override
  BottomNaviItem get bottomNaviItem => BottomNaviItem.Circle;

  @override
  List<Widget> listWidget(ShapeState shapeState) {
    List<Widget> list = List.empty(growable: true);
    for (var element in shapeState.listModel) {
      element as CircleModel;
      list.add(CustomPaint(
        painter: CirclePainter(
          color: HexColor.fromHex(element.colorHex),
          offset: Offset(element.dx ?? 0, element.dy ?? 0),
          diameter: element.diameter,
        ),
      ));
    }
    return list;
  }

  @override
  ShapeModel getShapeModel(BuildContext context, Offset offset) => CircleModel(
        dx: offset.dx,
        dy: offset.dy,
        diameter: Utils.getRandomDimenSize(context),
      );
}
