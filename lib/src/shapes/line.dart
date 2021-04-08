import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:touchable/src/shapes/constant.dart';
import 'package:touchable/src/shapes/shape.dart';
import 'package:touchable/src/shapes/util.dart';
import 'package:touchable/src/types/types.dart';

class Line extends Shape {
  final Offset p1;
  final Offset p2;
  double a, b;
  late double c; // Equation ax+by = c

  Line(this.p1, this.p2,
      {Map<GestureType, Function>? gestureMap,
      Paint? paint,
      HitTestBehavior? hitTestBehavior,
      PaintingStyle? paintStyleForTouch})
      : a = p2.dy - p1.dy,
        b = p1.dx - p2.dx,
        super(hitTestBehavior: hitTestBehavior, paint: paint ?? Paint(), gestureCallbackMap: gestureMap ?? {}) {
    c = a * p1.dx + b * p1.dy;
  }

//  ax + by = c
  @override
  bool isInside(Offset p) {
    var value = a * p.dx + b * p.dy - c;

    var threshold = paint.strokeWidth / 2;

    ///when cap is not round , then paint is not put beyond the end points
    if (paint.strokeCap == StrokeCap.round) {
      //TODO : Handle this case seperately
    }
    return _findPerpendicularDist(p, value) <= threshold &&
        _checkIfPointIsBetweenLineSegment(_findNearestPointOnTheLine(p));
  }

  ///Doesn't consider line thickness
  bool _checkIfPointIsBetweenLineSegment(Offset p) {
    return ShapeUtil.distance(p1, p) + ShapeUtil.distance(p2, p) - ShapeUtil.distance(p1, p2) <=
        ShapeConstant.floatPrecision;
  }

  Offset _findNearestPointOnTheLine(Offset p) {
    var ab = Offset(p2.dx - p1.dx, p2.dy - p1.dy);
    var k = ((p.dx - p1.dx) * ab.dx + (p.dy - p1.dy) * ab.dy) / (ab.dx * ab.dx + ab.dy * ab.dy);
    return Offset(p1.dx + k * ab.dx, p1.dy + k * ab.dy);
  }

  double _findPerpendicularDist(Offset p, double value) {
    return value.abs() / sqrt(a * a + b * b);
  }

  ///    if the line is a chord of an oval or circle , then this method returns true if a point lies on that side of the line
  ///    which is away from the center or the oval , i.e value of [expression] is [negative]
  bool isPointOnPositiveSide(Offset p) {
    return ((p2.dx - p1.dx) * (p.dy - p1.dy) - (p2.dy - p1.dy) * (p.dx - p1.dx)) < ShapeConstant.floatPrecision;
  }

  ///    if a point lies on that side of the line which is away from the center or the oval ,
  ///    then value of [expression] is [negative].
  ///    return value is [position] if the point lies to the right of the line or [negative] otherwise
  double getPointLyingOnSideTestValue(Offset p) {
    return ((p2.dx - p1.dx) * (p.dy - p1.dy) - (p2.dy - p1.dy) * (p.dx - p1.dx));
  }

  @override
  String toString() {
    return '$p1 - $p2';
  }
}
