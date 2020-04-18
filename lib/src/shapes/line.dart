import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:touchable/src/shapes/constant.dart';
import 'package:touchable/src/shapes/shape.dart';
import 'package:touchable/src/shapes/util.dart';
import 'package:touchable/src/types/types.dart';

/// Created by nateshmbhat on 04,April,2020

class Line extends Shape {
  final Offset p1;
  final Offset p2;
  double a, b, c; // Equation ax+by = c

  Line(this.p1, this.p2, {Map<GestureType, Function> gestureMap, Paint paint})
      : super(paint: paint, gestureCallbackMap: gestureMap) {
    a = p2.dy - p1.dy;
    b = p1.dx - p2.dx;
    c = a * p1.dx + b * p1.dy;
  }

//  ax + by = c
  @override
  bool isInside(Offset p) {
    var value = a * p.dx + b * p.dy - c;

    var threshold = paint.strokeWidth / 2;

    return _findPerpendicularDist(p, value) <= threshold &&
        max(ShapeUtil.distance(p1, p), ShapeUtil.distance(p2, p)) <=
            ShapeUtil.distance(p1, p2) + threshold;
  }

  double _findPerpendicularDist(Offset p, double value) {
    return value.abs() / sqrt(a * a + b * b);
  }

  ///    if the line is a chord of an oval or circle , then this method returns true if a point lies on that side of the line
  ///    which is away from the center or the oval , i.e value of [expression] is [negative]
  bool isPointOnPositiveSide(Offset p) {
    return ((p2.dx - p1.dx) * (p.dy - p1.dy) -
            (p2.dy - p1.dy) * (p.dx - p1.dx)) <
        ShapeConstant.floatPrecision;
  }

  ///    if a point lies on that side of the line which is away from the center or the oval ,
  ///    then value of [expression] is [negative].
  ///    return value is [position] if the point lies to the right of the line or [negative] otherwise
  double getPointLyingOnSideTestValue(Offset p) {
    return ((p2.dx - p1.dx) * (p.dy - p1.dy) -
        (p2.dy - p1.dy) * (p.dx - p1.dx));
  }

  @override
  String toString() {
    return '$p1 - $p2';
  }
}
