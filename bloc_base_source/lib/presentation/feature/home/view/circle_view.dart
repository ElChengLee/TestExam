import 'package:bloc_base_source/core/bloc/state.dart';
import 'package:bloc_base_source/core/widget/base_widget.dart';
import 'package:bloc_base_source/presentation/feature/home/bloc/home_bloc.dart';
import 'package:bloc_base_source/presentation/feature/home/model/bottom_navi_item.dart';
import 'package:bloc_base_source/presentation/feature/home/model/shape_model.dart';
import 'package:bloc_base_source/presentation/util/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widget/view/custom_painter.dart';
import '../bloc/home_event.dart';

class CircleShapeView extends BaseView<HomeBloc> {
  const CircleShapeView({Key? key}) : super(key: key);

  @override
  Widget buildView(BuildContext context, BaseState state) {
    return InkWell(
      onTapDown: (TapDownDetails details) {
        final bloc = BlocProvider.of<HomeBloc>(context);
        bloc.add(TapScreenEvent(
            BottomNaviItem.Circle,
            CircleModel(
              dx: details.globalPosition.dx,
              dy: details.globalPosition.dy,
              diameter: Utils.getRandomDimenSize(context),
            )));
      },
      // onDoubleTap: (TapDownDetails details) {
      //   final bloc = BlocProvider.of<HomeBloc>(context);
      //   bloc.add(DoubleTapScreenEvent(
      //       BottomNaviItem.Circle,
      //       CircleModel(
      //         dx: details.globalPosition.dx,
      //         dy: details.globalPosition.dy,
      //         diameter: Utils.getRandomDimenSize(context),
      //       )));
      // },
      child: Stack(
        children: [
          CustomPaint(
            painter: CirclePainter(
              color: Colors.red,
              offset: const Offset(50, 30),
              diameter: 100,
            ),
          )
        ],
      ),
    );
  }
}
