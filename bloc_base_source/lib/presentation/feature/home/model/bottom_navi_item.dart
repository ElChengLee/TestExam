import 'package:bloc_base_source/presentation/feature/home/bloc/home_state.dart';

enum BottomNaviItem { Square, Circle, Triangle, All }

extension BottomNaviItemExtension on BottomNaviItem {
  BottomNaviState get naviState {
    switch (this) {
      case BottomNaviItem.Circle:
        return CircleNaviState();
      case BottomNaviItem.Triangle:
        return TriangleNaviState();
      case BottomNaviItem.All:
        return AllNaviState();
      default:
        return SquareNaviState();
    }
  }
}

BottomNaviItem convertNaviStateToEnum(BottomNaviState state) {
  if (state is CircleNaviState) return BottomNaviItem.Circle;
  if (state is TriangleNaviState) return BottomNaviItem.Triangle;
  if (state is AllNaviState) return BottomNaviItem.All;
  return BottomNaviItem.Square;
}
