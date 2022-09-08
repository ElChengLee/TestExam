import 'package:bloc_base_source/core/bloc/state.dart';
import 'package:bloc_base_source/core/widget/base_widget.dart';
import 'package:bloc_base_source/presentation/feature/home/bloc/home_bloc.dart';
import 'package:bloc_base_source/presentation/feature/home/bloc/home_state.dart';
import 'package:flutter/material.dart';

import '../../../../core/widget/view/custom_painter.dart';

class AllShapeView extends BaseView<HomeBloc> {
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
  bool rebuildViewWhen(BaseState previous, BaseState current) =>
      current is ShapeDoubleTapState;
}
