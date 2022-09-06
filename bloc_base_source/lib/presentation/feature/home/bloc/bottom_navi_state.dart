abstract class BottomNaviState {}

class SquareNaviState extends BottomNaviState {
  final String title = "Square";
  final int itemIndex = 0;
}

class CircleNaviState extends BottomNaviState {
  final String title = "Circle";
  final int itemIndex = 1;
}

class TriangleNaviState extends BottomNaviState {
  final String title = "Triangle";
  final int itemIndex = 2;
}

class AllNaviState extends BottomNaviState {
  final String title = "All";
  final int itemIndex = 3;
}