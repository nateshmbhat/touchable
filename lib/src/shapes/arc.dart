import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:touchable/src/shapes/constant.dart';
import 'package:touchable/src/shapes/line.dart';
import 'package:touchable/src/shapes/oval.dart';
import 'package:touchable/src/shapes/shape.dart';
import 'package:touchable/src/types/types.dart';

///See https://math.stackexchange.com/questions/3622277/how-to-test-if-a-point-lies-inside-a-segment-of-an-arc-that-is-formed-by-a-recta?noredirect=1#comment7446310_3622277
///for more info on point detection
class Arc extends Shape {
  final Rect rect;
  double startAngle;
  double sweepAngle;
  final bool useCenter;

  late Oval _oval;

  late Offset _arcStartPoint;
  late Line _chordLine;

  Line get chordLine => _chordLine;
  late Line _originToArcStartLine;

  late Line _originToArcEndLine;
  late Offset _arcEndPoint;

  Arc(this.rect, this.startAngle, this.sweepAngle, this.useCenter,
      {Paint? paint,
      Map<GestureType, Function>? gestureMap,
      HitTestBehavior? hitTestBehavior,
      PaintingStyle? paintStyleForTouch})
      : super(hitTestBehavior: hitTestBehavior, paint: paint , gestureCallbackMap: gestureMap) {
    _oval = Oval(rect, paint: paint);

    if (sweepAngle < 0) {
//      if sweep angle is negative , make the endangle as the start angle and make sweep angle positive
      startAngle = startAngle + sweepAngle;
      sweepAngle = sweepAngle.abs();
    }

    var cosStartAngle = cos(startAngle);
    var startPointPhi = atan2(_oval.a * sin(startAngle), _oval.b * cosStartAngle);

    var endAngle = startAngle + sweepAngle;
    var cosEndAngle = cos(endAngle);
    var endPointPhi = atan2(_oval.a * sin(endAngle), _oval.b * cosEndAngle);

    _arcStartPoint =
        Offset(rect.center.dx + _oval.a * cos(startPointPhi), rect.center.dy + _oval.b * sin(startPointPhi));
    _arcEndPoint = Offset(rect.center.dx + _oval.a * cos(endPointPhi), rect.center.dy + _oval.b * sin(endPointPhi));

    _chordLine = Line(_arcStartPoint, _arcEndPoint, paint: paint);
    _originToArcStartLine = Line(rect.center, _arcStartPoint, paint: paint);
    _originToArcEndLine = Line(rect.center, _arcEndPoint, paint: paint);
  }

  @override
  bool isInside(Offset p) {
    if (useCenter) {
      if (paint.style == PaintingStyle.stroke) {
        return (_oval.isOnTheOval(p) && (_isBetweenArcStartAndEndLines(p) || sweepAngle.abs() >= 2 * pi)) ||
            (_originToArcStartLine.isInside(p)) ||
            (_originToArcEndLine.isInside(p));
      } else {
        return _oval.isInside(p) && _isBetweenArcStartAndEndLines(p);
      }
    } else {
      if (sweepAngle.abs() >= 2 * pi) return _oval.isInside(p);
      return _handleCircleSegmentCheck(p);
    }
  }

  bool _handleCircleSegmentCheck(Offset p) {
    if (paint.style == PaintingStyle.stroke) {
      return _oval.isOnTheOval(p) && _isBetweenArcStartAndEndLines(p);
    } else {
      return _chordLine.isPointOnPositiveSide(p) && _oval.isInside(p);
    }
  }

  /// Does [not] consider the [paint.strokeWidth] of the lines.
  bool _isBetweenArcStartAndEndLines(Offset p) {
    var startLineSideValue = _originToArcStartLine.getPointLyingOnSideTestValue(p);
    var endLineSideValue = _originToArcEndLine.getPointLyingOnSideTestValue(p);
    var threshold = ShapeConstant.floatPrecision;
    if (sweepAngle <= pi) {
      return startLineSideValue > threshold && endLineSideValue < threshold;
    } else {
      return (startLineSideValue > threshold) || (endLineSideValue < threshold);
    }
  }
}
