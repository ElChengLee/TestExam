import 'package:bloc_base_source/di/locator.dart';
import 'package:bloc_base_source/presentation/feature/home/bloc/shape/shape_bloc.dart';
import 'package:bloc_base_source/presentation/feature/home/bloc/shape/shape_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/bloc/state.dart';
import '../../../../../core/widget/base_widget.dart';
import '../../bloc/shape/shape_event.dart';
import '../../model/bottom_navi_item.dart';
import '../../model/shape_model.dart';
import '../../remote/repository/home_repository.dart';

abstract class ShapeScreen extends BaseView<ShapeBloc> {
  ShapeScreen({Key? key}) : super(key: key);

  BottomNaviItem get bottomNaviItem;

  Offset _tapPosition = const Offset(0, 0);

  void _handleTapDown(BuildContext context, TapDownDetails details) {
    final RenderBox box = context.findRenderObject() as RenderBox;
    _tapPosition = box.globalToLocal(details.globalPosition);
  }

  @override
  Widget buildView(BuildContext context, BaseState state) {
    state as ShapeState;
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        final bloc = BlocProvider.of<ShapeBloc>(context);
        bloc.add(TapScreenEvent(
            bottomNaviItem, getShapeModel(context, _tapPosition)));
      },
      onDoubleTap: () {
        final bloc = BlocProvider.of<ShapeBloc>(context);
        bloc.add(DoubleTapScreenEvent(
            bottomNaviItem, getShapeModel(context, _tapPosition)));
      },
      onTapDown: (TapDownDetails details) async {
        _handleTapDown(context, details);
      },
      onDoubleTapDown: (TapDownDetails details) {
        _handleTapDown(context, details);
      },
      child: Stack(children: listWidget(state)),
    );
  }

  ShapeModel getShapeModel(BuildContext context, Offset offset);

  List<Widget> listWidget(ShapeState shapeState);

  @override
  ShapeBloc createBloc() {
    return ShapeBloc(locator<HomeRepository>());
  }
}