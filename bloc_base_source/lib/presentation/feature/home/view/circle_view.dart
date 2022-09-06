import 'package:bloc_base_source/core/bloc/state.dart';
import 'package:bloc_base_source/core/widget/base_widget.dart';
import 'package:bloc_base_source/presentation/feature/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';

import '../../../../core/widget/view/custom_painter.dart';

class CircleShapeView extends BaseView<HomeBloc> {
  @override
  Widget buildView(BuildContext context, BaseState state) {
    return Stack(
      children: [
        CustomPaint(
          painter: CirclePainter(
            color: Colors.red,
            offset: const Offset(50, 30),
            diameter: 100,
          ),
        )
      ],
    );
  }
}
