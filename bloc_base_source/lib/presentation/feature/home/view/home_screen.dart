import 'package:bloc_base_source/core/bloc/state.dart';
import 'package:bloc_base_source/core/widget/view/custom_painter.dart';
import 'package:bloc_base_source/presentation/feature/home/bloc/home_bloc.dart';
import 'package:bloc_base_source/presentation/feature/home/remote/repository/home_repository.dart';
import 'package:bloc_base_source/presentation/feature/home/view/all_view.dart';
import 'package:bloc_base_source/presentation/feature/home/view/circle_view.dart';
import 'package:bloc_base_source/presentation/feature/home/view/square_view.dart';
import 'package:bloc_base_source/presentation/feature/home/view/triangle_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widget/base_widget.dart';
import '../../../../core/widget/keep_alive_widget.dart';
import '../../../../di/locator.dart';
import '../bloc/home_event.dart';
import '../bloc/home_state.dart';
import '../model/bottom_navi_item.dart';

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
  Widget buildView(BuildContext context, BaseState state) {
    if (state is! BottomNaviState) {
      return Container();
    }
    BottomNaviItem bottomNaviItem = convertNaviStateToEnum(state);
    return Scaffold(
      body: buildPageView(context),
      bottomNavigationBar: buildBottomNavi(context, bottomNaviItem),
    );
  }

  @override
  bool rebuildViewWhen(BaseState previous, BaseState current) =>
       current is BottomNaviState;

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
