import 'dart:math';

import 'package:bloc_base_source/core/bloc/state.dart';
import 'package:bloc_base_source/core/widget/base_widget.dart';
import 'package:bloc_base_source/presentation/feature/home/bloc/home_bloc.dart';
import 'package:bloc_base_source/presentation/feature/home/model/shape_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/home_event.dart';
import '../../../model/bottom_navi_item.dart';

@immutable
abstract class ShapeView extends BaseView<HomeBloc> {
  abstract BottomNaviItem item;

  ShapeView({Key? key}) : super(key: key);

  @override
  Widget buildView(BuildContext context, BaseState state) {
    return GestureDetector(
      onTapDown: (TapDownDetails details) {
        final bloc = BlocProvider.of<HomeBloc>(context);
        bloc.add(TapScreenEvent(
            item, getEventData(context, details.globalPosition)));
      },
      onDoubleTapDown: (TapDownDetails details) {
        final bloc = BlocProvider.of<HomeBloc>(context);
        bloc.add(DoubleTapScreenEvent(
            item, getEventData(context, details.globalPosition)));
      },
      child: Stack(children: listChildView(state)),
    );
  }

  ShapeModel getEventData(BuildContext context, Offset offset);

  int getRandomSize(BuildContext context) {
    double height = MediaQuery
        .of(context)
        .size
        .height;
    double width = MediaQuery
        .of(context)
        .size
        .width;
    int minDimen = ([height, width].reduce(max) * 10 / 100).round();
    int maxDimen = ([height, width].reduce(max) * 45 / 100).round();
    return minDimen + Random().nextInt(maxDimen - minDimen);
  }

  List<Widget> listChildView(BaseState state);

}
