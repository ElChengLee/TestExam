import 'package:bloc_base_source/core/bloc/state.dart';
import 'package:bloc_base_source/core/widget/view/custom_painter.dart';
import 'package:bloc_base_source/presentation/feature/home/bloc/home_bloc.dart';
import 'package:bloc_base_source/presentation/feature/home/remote/repository/home_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widget/base_widget.dart';
import '../../../../di/locator.dart';
import '../bloc/home_event.dart';

class HomeScreen extends BaseView<HomeBloc> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeBloc createBloc() {
    return HomeBloc(locator<HomeRepository>());
  }

  @override
  Widget buildView(BuildContext context, BaseState state) {
    return Scaffold(
      body: Stack(
        children: [
          CustomPaint(
            painter: TrianglePainter(
              width: 30,
              color: Colors.red,
              height: 30,
              offset: Offset(50, 150),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: CustomPaint(
              painter: SquaresPainter(
                dimension: 20,
                color: Colors.red,
              ),
            ),
            label: 'Squares',
          ),
          BottomNavigationBarItem(
            icon: CustomPaint(
              painter: CirclePainter(color: Colors.red, diameter: 20),
            ),
            label: 'Circle',
          ),
          BottomNavigationBarItem(
            icon: CustomPaint(
              painter: TrianglePainter(
                width: 20,
                color: Colors.red,
                height: 20,
              ),
            ),
            label: 'Triangle',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.sync,
              color: Colors.red,
            ),
            label: 'Random',
          ),
        ],
        selectedItemColor: Colors.amberAccent,
        onTap: (index) {
          final bloc = BlocProvider.of<HomeBloc>(context);
          bloc.add(TapNavigationPage(index));
        },
      ),
    );
  }
}
