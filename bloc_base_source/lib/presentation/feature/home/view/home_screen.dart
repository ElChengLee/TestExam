import 'package:bloc_base_source/core/bloc/state.dart';
import 'package:bloc_base_source/core/widget/view/custom_painter.dart';
import 'package:bloc_base_source/presentation/feature/home/bloc/home_bloc.dart';
import 'package:bloc_base_source/presentation/feature/home/remote/repository/home_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widget/base_widget.dart';
import '../../../../core/widget/keep_alive_widget.dart';
import '../../../../di/locator.dart';
import '../bloc/home_event.dart';
import '../bloc/home_state.dart';
import '../model/bottom_navi_item.dart';
import 'shape/all_view.dart';
import 'shape/circle_view.dart';
import 'shape/square_view.dart';
import 'shape/triangle_view.dart';

class HomeScreen extends BaseView<HomeBloc> {
  HomeScreen({Key? key}) : super(key: key);

  @override
  HomeBloc createBloc() {
    return HomeBloc(locator<HomeRepository>());
  }

  PageController pageController = PageController(
    keepPage: true,
  );

  @override
  bool rebuildViewWhen(BaseState previous, BaseState current) {
    return current is BottomNaviState;
  }

  @override
  Widget buildView(BuildContext context, BaseState state) {
    BottomNaviItem bottomNaviItem = convertNaviStateToEnum(state as BottomNaviState);
    return Scaffold(
      body: buildPageView(context),
      bottomNavigationBar: buildBottomNavi(context, bottomNaviItem),
    );
  }

  Widget buildPageView(
    BuildContext context,
  ) {
    return PageView(
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(),
      onPageChanged: (index) {
        final bloc = BlocProvider.of<HomeBloc>(context);
        bloc.add(TapNaviEvent(index));
      },
      children: <Widget>[
        KeepAliveWidget(child: SquareShapeView()),
        KeepAliveWidget(child: CircleShapeView()),
        KeepAliveWidget(child: TriangleShapeView()),
        KeepAliveWidget(child: AllShapeView()),
      ],
    );
  }

  buildBottomNavi(
    BuildContext context,
    BottomNaviItem bottomNaviItem,
  ) {
    return BottomNavigationBar(
      currentIndex: BottomNaviItem.values.indexOf(bottomNaviItem),
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: CustomPaint(
            painter: SquaresPainter(
              dimension: 20,
              color: bottomNaviItem == BottomNaviItem.Square
                  ? Colors.red
                  : Colors.grey,
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: CustomPaint(
            painter: CirclePainter(
                color: bottomNaviItem == BottomNaviItem.Circle
                    ? Colors.red
                    : Colors.grey,
                diameter: 20),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: CustomPaint(
            painter: TrianglePainter(
              width: 20,
              color: bottomNaviItem == BottomNaviItem.Triangle
                  ? Colors.red
                  : Colors.grey,
              height: 20,
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.sync,
            color:
                bottomNaviItem == BottomNaviItem.All ? Colors.red : Colors.grey,
          ),
          label: '',
        ),
      ],
      onTap: (index) {
        pageController.animateToPage(index,
            duration: const Duration(milliseconds: 200), curve: Curves.ease);
        final bloc = BlocProvider.of<HomeBloc>(context);
        bloc.add(TapNaviEvent(index));
      },
    );
  }
}
