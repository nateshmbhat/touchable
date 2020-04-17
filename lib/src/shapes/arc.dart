// Created by nateshmbhat on 12,April,2020

import 'dart:math';
import 'dart:ui';

import 'package:touchable/src/shapes/line.dart';
import 'package:touchable/src/shapes/oval.dart';
import 'package:touchable/src/shapes/shape.dart';
import 'package:touchable/src/types/types.dart';

///See https://math.stackexchange.com/questions/3622277/how-to-test-if-a-point-lies-inside-a-segment-of-an-arc-that-is-formed-by-a-recta?noredirect=1#comment7446310_3622277
///for more info on point detection
class Arc extends Shape {
  final Rect rect;
  final double startAngle;
  final double sweepAngle;
  final bool useCenter;

  Oval _oval;

  Offset _arcStartPoint;
  Line _chordLine;

  Line _originToArcStartLine;

  Line _originToArcEndLine;
  Offset _arcEndPoint;

  Arc(this.rect, this.startAngle, this.sweepAngle, this.useCenter,
      {Paint paint, Map<GestureType, Function> gestureMap})
      : super(paint: paint, gestureCallbackMap: gestureMap) {
    _oval = Oval(rect, paint: paint);

    var cosStartAngle = cos(startAngle);
    var startPointPhi =
    atan2(_oval.a * sin(startAngle), _oval.b * cosStartAngle);

    var endAngle = startAngle + sweepAngle;
    var cosEndAngle = cos(endAngle);
    var endPointPhi = atan2(_oval.a * sin(endAngle), _oval.b * cosEndAngle);

    _arcStartPoint = Offset(rect.center.dx + _oval.a * cos(startPointPhi),
        rect.center.dy + _oval.b * sin(startPointPhi));
    _arcEndPoint = Offset(rect.center.dx + _oval.a * cos(endPointPhi),
        rect.center.dy + _oval.b * sin(endPointPhi));

    _chordLine = Line(_arcStartPoint, _arcEndPoint, paint: paint);
    _originToArcStartLine = Line(rect.center, _arcStartPoint, paint: paint);
    _originToArcEndLine = Line(rect.center, _arcEndPoint, paint: paint);
  }

// TODO : implement below method
  @override
  bool isInside(Offset p) {
    if (useCenter) {
//      Handle sector
      //TODO : test this condition

      var startLineSideValue = _originToArcStartLine
          .getPointLyingOnSideTestValue(p);
      var endLineSideValue = _originToArcEndLine.getPointLyingOnSideTestValue(
          p);
      print(
          'origint to startline side value :  startLineSide ${startLineSideValue} , endLineSide ${endLineSideValue} ');

      if (sweepAngle <= pi) {
        return _oval.isInside(p) && startLineSideValue > 0 &&
            endLineSideValue < 0;
      } else {
        return _oval.isInside(p) &&
            ((startLineSideValue > 0) || (endLineSideValue < 0));
      }
    } else {
      return _handleCircleSegmentCheck(p);
    }
  }

  bool _handleCircleSegmentCheck(Offset p) {
    if (paint.style == PaintingStyle.stroke) {
      //TODO : test this condition
      return _chordLine.isPointOnPositiveSide(p) &&
          _oval.isInside(p);
    } else {
      // TODO : DONE
      return _chordLine.isPointOnPositiveSide(p) &&
          _oval.isInside(p);
    }
  }
}
