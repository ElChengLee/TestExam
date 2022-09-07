import 'package:bloc_base_source/presentation/feature/home/model/bottom_navi_item.dart';
import 'package:flutter/material.dart';

import '../../../../../core/bloc/state.dart';
import '../../model/shape_model.dart';
import 'base/shape_view.dart';

class SquareShapeView extends ShapeView {
  @override
  BottomNaviItem item = BottomNaviItem.Square;

  SquareShapeView({Key? key}) : super(key: key);

  @override
  ShapeModel getEventData(BuildContext context, Offset offset) => CircleModel();

  @override
  List<Widget> listChildView(BaseState state) {
    // CircleTapState circleState = state as CircleTapState;
    List<Widget> listWidget = List.empty(growable: true);
    // for (var element in circleState.listModel) {
    //   listWidget.add(CustomPaint(
    //     painter: CirclePainter(
    //       color: element.color,
    //       offset: element.offset,
    //       diameter: 100,
    //     ),
    //   ));
    // }
    return listWidget;
  }
}
