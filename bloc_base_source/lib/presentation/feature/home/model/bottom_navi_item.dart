import 'package:bloc_base_source/presentation/feature/home/bloc/home_state.dart';

enum BottomNaviItem { Square, Circle, Triangle, All }

extension BottomNaviItemExtension on BottomNaviItem {
  BottomNaviState get naviState =>
      BottomNaviState(index: BottomNaviItem.values.indexOf(this));
}

BottomNaviItem convertNaviStateToEnum(BottomNaviState state) {
  return BottomNaviItem.values[state.index];
}
