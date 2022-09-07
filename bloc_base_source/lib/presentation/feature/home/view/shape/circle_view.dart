import 'package:flutter/material.dart';

import '../../../../../core/bloc/state.dart';
import '../../../../../core/widget/base_widget.dart';
import '../../../../../core/widget/view/custom_painter.dart';
import '../../bloc/home_bloc.dart';

class CircleShapeView extends BaseView<HomeBloc> {
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
}