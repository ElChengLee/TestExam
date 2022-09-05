import 'package:flutter/material.dart';

const defaultOffset = Offset(0, 0);

abstract class Painter extends CustomPainter {}

class CirclePainter extends Painter {
  final Offset offset;
  final Color color;
  final double diameter;

  CirclePainter(
      {this.offset = defaultOffset,
      required this.color,
      required this.diameter});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    canvas.drawCircle(offset, diameter / 2, paint);
  }

  @override
  bool shouldRepaint(CirclePainter oldDelegate) =>
      oldDelegate.offset != offset ||
      oldDelegate.color != color ||
      oldDelegate.diameter != diameter;
}

class TrianglePainter extends Painter {
  final Color color;
  final Offset offset;
  final double width;
  final double height;

  TrianglePainter({
    this.color = Colors.black,
    required this.width,
    required this.height,
    this.offset = defaultOffset,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = color;
    // canvas.drawPath(getTrianglePath(width, height), paint);
    final Offset triangleOffset = offset + Offset(width / 2, height);
    var path = Path();

    path.moveTo(triangleOffset.dx, -triangleOffset.dy);

    path.lineTo(triangleOffset.dx - (width / 2), triangleOffset.dy - height);
    path.lineTo(triangleOffset.dx + (width / 2), triangleOffset.dy - height);

    path.moveTo(triangleOffset.dx + (width / 2), triangleOffset.dy - height);
    path.lineTo(triangleOffset.dx - (width / 2), triangleOffset.dy - height);
    path.close();

    canvas.drawPath(path, paint);
  }

  Path getTrianglePath(double x, double y) {
    return Path()
      ..moveTo(offset.dx, y)
      ..lineTo(x / 2, offset.dy)
      ..lineTo(x, y)
      ..lineTo(offset.dx, y);
  }

  @override
  bool shouldRepaint(TrianglePainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.offset != offset ||
        oldDelegate.width != width ||
        oldDelegate.height != height;
  }
}

class SquaresPainter extends Painter {
  final Color color;
  final double dimension;
  final Offset offset;

  SquaresPainter({
    this.color = Colors.black,
    required this.dimension,
    this.offset = defaultOffset,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = color;
    canvas.drawRect(
        Rect.fromCenter(center: offset, width: dimension, height: dimension),
        paint);
  }

  @override
  bool shouldRepaint(SquaresPainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.dimension != dimension ||
        oldDelegate.offset != offset;
  }
}
