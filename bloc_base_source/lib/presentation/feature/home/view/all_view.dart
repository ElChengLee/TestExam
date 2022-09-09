import 'package:bloc_base_source/core/bloc/state.dart';
import 'package:bloc_base_source/core/widget/base_widget.dart';
import 'package:bloc_base_source/presentation/feature/home/bloc/navigation/navigation_state.dart';
import 'package:bloc_base_source/presentation/feature/home/bloc/shape/shape_bloc.dart';
import 'package:flutter/material.dart';

import '../../../../core/widget/view/custom_painter.dart';
import '../../../../di/locator.dart';
import '../remote/repository/home_repository.dart';

class AllShapeView extends BaseView<ShapeBloc> {
  @override
  Widget buildView(BuildContext context, BaseState state) {
    return Stack(
      children: [
        CustomPaint(
          painter: TrianglePainter(
            width: 200,
            color: Colors.red,
            height: 100,
            offset: const Offset(50, 30),
          ),
        )
      ],
    );
  }

  @override
  ShapeBloc createBloc() {
    return ShapeBloc(locator<HomeRepository>());
  }

  @override
  bool rebuildViewWhen(BaseState previous, BaseState current) =>
      current is ShapeDoubleTapState;
}
