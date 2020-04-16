import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:touchable/src/shapes/shape.dart';
import 'package:touchable/src/shapes/util.dart';
import 'package:touchable/src/types/types.dart';

/// Created by nateshmbhat on 04,April,2020

class Line extends Shape {
  final Offset p1;
  final Offset p2;
  double a, b, c; // Equation ax+by = c

  Line(this.p1, this.p2,
      {Map<GestureType, Function> gestureMap, Paint paint})
      : super(paint: paint, gestureCallbackMap: gestureMap) {
    a = p2.dy - p1.dy;
    b = p1.dx - p2.dx;
    c = a * p1.dx + b * p1.dy;
  }

//  ax + by = c
  bool isInside(Offset p) {
    var value = a * p.dx + b * p.dy - c;
    return _findPerpendicularDist(p, value) <= paint.strokeWidth / 2 &&
        max(ShapeUtil.distance(p1, p), ShapeUtil.distance(p2, p)) <=
            ShapeUtil.distance(p1, p2) + paint.strokeWidth / 2;
  }

  double _findPerpendicularDist(Offset p, double value) {
    return value.abs() / sqrt(a * a + b * b);
  }

  bool isPointOnPositiveSide(Offset p) {
    return ((p2.dx - p1.dx) * (p.dy - p1.dy) -
        (p2.dy - p1.dy) * (p.dx - p1.dx)) >= -paint.strokeWidth / 2;
  }

  @override
  String toString() {
    return '$p1 - $p2';
  }
}
