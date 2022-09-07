import 'package:flutter/material.dart';

const defaultOffset = Offset(0, 0);

abstract class Painter extends CustomPainter {}

class CirclePainter extends Painter {
  final Offset? offset;
  final Color? color;
  final int? diameter;

  CirclePainter({this.offset, required this.color, required this.diameter});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color ?? Colors.white
      ..style = PaintingStyle.fill;
    canvas.drawCircle(offset ?? defaultOffset, diameter?.toDouble() ?? 0 / 2, paint);
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
    var path = Path();
    path.moveTo(offset.dx, (offset.dy - (height / 2)));
    path.lineTo(offset.dx + (width / 2), (offset.dy + (height / 2)));
    path.lineTo(offset.dx - (width / 2), (offset.dy + (height / 2)));

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
