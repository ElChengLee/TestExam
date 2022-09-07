import 'dart:math';

import 'package:flutter/material.dart';

class Utils {
  static int getRandomDimenSize(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    int minDimen = ([height, width].reduce(max) * 10 / 100).round();
    int maxDimen = ([height, width].reduce(max) * 45 / 100).round();
    return minDimen + Random().nextInt(maxDimen - minDimen);
  }
}
