import 'package:bloc_base_source/di/locator.dart';
import 'package:bloc_base_source/presentation/feature/home/bloc/shape/shape_bloc.dart';
import 'package:bloc_base_source/presentation/feature/home/bloc/shape/shape_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/bloc/state.dart';
import '../../../../../core/widget/base_widget.dart';
import '../../../../util/utils.dart';
import '../../bloc/shape/shape_event.dart';
import '../../model/bottom_navi_item.dart';
import '../../model/shape_model.dart';
import '../../remote/repository/home_repository.dart';

abstract class ShapeScreen extends BaseView<ShapeBloc> {
  const ShapeScreen({Key? key}) : super(key: key);

  BottomNaviItem get bottomNaviItem;

  @override
  Widget buildView(BuildContext context, BaseState state) {
    state as ShapeState;
    return InkWell(
      onTapDown: (TapDownDetails details) async {
        final bloc = BlocProvider.of<ShapeBloc>(context);
        bloc.add(TapScreenEvent(
            bottomNaviItem,
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
          children: listWidget(state)),
    );
  }

  List<Widget> listWidget(ShapeState shapeState);

  @override
  ShapeBloc createBloc() {
    return ShapeBloc(locator<HomeRepository>());
  }
}