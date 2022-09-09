import 'package:bloc_base_source/core/bloc/state.dart';
import 'package:bloc_base_source/presentation/feature/home/bloc/shape/shape_state.dart';
import 'package:bloc_base_source/presentation/feature/home/model/bottom_navi_item.dart';
import 'package:bloc_base_source/presentation/feature/home/model/shape_model.dart';
import 'package:flutter/material.dart';

import '../../../../core/widget/view/custom_painter.dart';
import 'shape/shape_screen.dart';

class CircleShapeView extends ShapeScreen {
  const CircleShapeView({Key? key}) : super(key: key);

  @override
  bool rebuildViewWhen(BaseState previous, BaseState current) {
    return current is CircleTapState;
  }

  @override
  BottomNaviItem get bottomNaviItem => BottomNaviItem.Circle;

  @override
  List<Widget> listWidget(ShapeState shapeState) {
    return [
      CustomPaint(
        painter: CirclePainter(
          color: Colors.red,
          offset: const Offset(50, 30),
          diameter: 100,
        ),
      )
    ];
  }
}
