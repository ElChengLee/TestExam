import 'package:bloc_base_source/core/bloc/state.dart';
import 'package:bloc_base_source/core/widget/view/custom_painter.dart';
import 'package:bloc_base_source/presentation/feature/home/bloc/bottom_navi_state.dart';
import 'package:bloc_base_source/presentation/feature/home/bloc/home_bloc.dart';
import 'package:bloc_base_source/presentation/feature/home/remote/repository/home_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widget/base_widget.dart';
import '../../../../di/locator.dart';
import '../bloc/home_event.dart';

class HomeScreen extends StatefulWidget  {
  const HomeScreen({Key? key}) : super(key: key);


  @override
  Widget buildView(BuildContext context, BaseState state) {
    return Scaffold(
      body: Stack(
        children: [
          CustomPaint(
            painter: TrianglePainter(
              width: 200,
              color: Colors.red,
              height: 100,
              offset: const Offset(50, 30),
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
            label: '',
          ),
          BottomNavigationBarItem(
            icon: CustomPaint(
              painter: CirclePainter(color: Colors.red, diameter: 20),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: CustomPaint(
              painter: TrianglePainter(
                width: 20,
                color: Colors.red,
                height: 20,
              ),
            ),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.sync,
              color: Colors.red,
            ),
            label: '',
          ),
        ],
        onTap: (index) {
          final bloc = BlocProvider.of<HomeBloc>(context);
          bloc.add(TapNavigationPage(index));
        },
      ),
    );
  }

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late HomeBloc _homeBloc;

  @override
  void initState() {
    super.initState();
    _homeBloc = HomeBloc();
  }

  @override
  void dispose() {
    _homeBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _homeBloc,
      builder: (BuildContext context, BottomNaviState state) {
        // if (state is ShowBlue)
        //   return buildHomepage(state.title, Colors.blue, state.itemIndex);
        // if (state is ShowGreen)
        //   return buildHomepage(state.title, Colors.green, state.itemIndex);
        // if (state is ShowRed)
        //   return buildHomepage(state.title, Colors.red, state.itemIndex);
        return Container();
      },
    );
  }

}
