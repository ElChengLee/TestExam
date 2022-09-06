import 'package:bloc_base_source/core/bloc/state.dart';
import 'package:bloc_base_source/core/widget/base_widget.dart';
import 'package:bloc_base_source/presentation/feature/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home_event.dart';
import '../model/bottom_navi_item.dart';

abstract class ShapeView extends BaseView<HomeBloc> {
  final BottomNaviItem item;

  final List<Widget> listChild = List.empty(growable: true);

  ShapeView({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget buildView(BuildContext context, BaseState state) {
    return GestureDetector(
      onTapDown: (TapDownDetails details) {
        final bloc = BlocProvider.of<HomeBloc>(context);
        bloc.add(TapScreenEvent(item, details.globalPosition));
      },
      onDoubleTapDown: (TapDownDetails details) {
        final bloc = BlocProvider.of<HomeBloc>(context);
        bloc.add(DoubleTapScreenEvent(item, details.globalPosition));
      },
      child: Stack(children: listChild),
    );
  }
}
