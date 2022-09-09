import 'package:bloc_base_source/core/bloc/state.dart';
import 'package:bloc_base_source/core/widget/base_widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/widget/view/custom_painter.dart';
import '../../../../di/locator.dart';
import '../bloc/navigation/navigation_state.dart';
import '../bloc/shape/shape_bloc.dart';
import '../remote/repository/home_repository.dart';

class SquareShapeView extends BaseView<ShapeBloc> {
  const SquareShapeView({Key? key}) : super(key: key);

  @override
  Widget buildView(BuildContext context, BaseState state) {
    return Stack(
      children: [
        CustomPaint(
          painter: SquaresPainter(
            color: Colors.red,
            offset: const Offset(50, 30),
            dimension: 150,
          ),
        )
      ],
    );
  }

  @override
  bool rebuildViewWhen(BaseState previous, BaseState current) =>
      current is ShapeTapState;

  @override
  ShapeBloc createBloc() {
    return ShapeBloc(locator<HomeRepository>());
  }
}
