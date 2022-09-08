import 'package:bloc_base_source/core/bloc/state.dart';
import 'package:bloc_base_source/core/widget/base_widget.dart';
import 'package:bloc_base_source/presentation/feature/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';

import '../../../../core/widget/view/custom_painter.dart';
import '../bloc/home_state.dart';

class SquareShapeView extends BaseView<HomeBloc> {
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
}
