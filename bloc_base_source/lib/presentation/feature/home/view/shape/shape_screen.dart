import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/bloc/state.dart';
import '../../../../../core/widget/base_widget.dart';
import '../../bloc/home_bloc.dart';
import '../../bloc/home_event.dart';
import '../../model/bottom_navi_item.dart';

abstract class ShapeScreen extends BaseView<HomeBloc> {

  BottomNaviItem get bottomNaviItem;

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
        ],
      ),
    );
  }


}