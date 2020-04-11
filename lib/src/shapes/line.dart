import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:touchable/src/shapes/constant.dart';
import 'package:touchable/src/shapes/rectangle.dart';
import 'package:touchable/src/shapes/shape.dart';
import 'package:touchable/src/shapes/util.dart';
import 'package:meta/meta.dart';
import 'package:touchable/src/shapes/util.dart';
import 'package:touchable/src/shapes/util.dart';

/// Created by nateshmbhat on 04,April,2020

class Line extends Shape {
  final Offset p1;
  final Offset p2;
  double a, b, c; // Equation ax+by = c

  Line(this.p1, this.p2, {GestureTapDownCallback onTapDown, Paint paint})
      : super(onTapDown: onTapDown, paint: paint) {
    a = p2.dy - p1.dy;
    b = p1.dx - p2.dx;
    c = a * p1.dx + b * p1.dy;
  }

//  ax + by = c
  bool isInside(Offset p) {
    var value = a * p.dx + b * p.dy - c;
    return value <= paint.strokeWidth / 2 &&
        max(ShapeUtil.distance(p1, p), ShapeUtil.distance(p2, p)) <=
            ShapeUtil.distance(p1, p2) + paint.strokeWidth / 2 &&
        _findPerpendicularDist(p, value) <= paint.strokeWidth / 2;
  }

  double _findPerpendicularDist(Offset p, double value) {
    return value.abs() / sqrt(a * a + b * b);
  }
}
