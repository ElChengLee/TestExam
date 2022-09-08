import 'package:bloc_base_source/core/bloc/state.dart';
import 'package:bloc_base_source/core/widget/base_widget.dart';
import 'package:bloc_base_source/presentation/feature/home/bloc/home_bloc.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';

import '../../../../core/widget/view/custom_painter.dart';
import '../bloc/home_state.dart';

class TriangleShapeView extends BaseView<HomeBloc> {
  const TriangleShapeView({Key? key}) : super(key: key);

  @override
  Widget buildView(BuildContext context, BaseState state) {
    return InkWell(
      onTapDown: (TapDownDetails details) {
        Fimber.e("tap");
      },
      child: Stack(
        children: [
          CustomPaint(
            painter: TrianglePainter(
              width: 200,
              color: Colors.red,
              height: 100,
              offset: const Offset(150, 130),
            ),
          )
        ],
      ),
    );
  }


  @override
  bool rebuildViewWhen(BaseState previous, BaseState current) =>
      current is ShapeDoubleTapState;
}
