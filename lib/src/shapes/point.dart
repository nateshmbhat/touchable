import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:touchable/src/shapes/circle.dart';
import 'package:touchable/src/shapes/line.dart';
import 'package:touchable/src/shapes/shape.dart';
import 'package:touchable/src/types/types.dart';

class Point extends Shape {
  final PointMode pointMode;

  final List<Offset> points;

  Point(this.pointMode, this.points,
      {Map<GestureType, Function>? gestureMap,
      Paint? paint,
      HitTestBehavior? hitTestBehavior,
      PaintingStyle? paintStyleForTouch})
      : super(hitTestBehavior: hitTestBehavior, paint: paint ?? Paint(), gestureCallbackMap: gestureMap ?? {});

  @override
  bool isInside(Offset p) {
    switch (pointMode) {
      case PointMode.points:
        for (Offset point in points) {
          if (_checkPointLiesInsideAnotherPoint(point, p)) return true;
        }
        return false;
      case PointMode.lines:
        for (int i = 0; i < points.length; i += 2) {
          if (i + 1 >= points.length) return false;
          if (Line(points[i], points[i + 1], paint: paint).isInside(p)) {
            return true;
          }
        }
        return false;
      case PointMode.polygon:
        for (int i = 1; i < points.length; i += 1) {
          if (Line(points[i - 1], points[i], paint: paint).isInside(p)) {
            return true;
          }
        }
        return false;
      default:
        return false;
    }
  }

  bool _checkPointLiesInsideAnotherPoint(Offset point, Offset queryPoint) {
    if (point == queryPoint) return true;
    var extraWidth = paint.strokeWidth / 2;
    if (paint.strokeCap == StrokeCap.round) {
      return Circle(center: point, radius: extraWidth).isInside(queryPoint);
    } else {
      return Rect.fromCenter(center: point, width: extraWidth * 2, height: extraWidth * 2).contains(queryPoint);
    }
  }
}

class PolygonUtil {
  static int _direction(Offset a, Offset b, Offset c) {
    double val = (b.dy - a.dy) * (c.dx - b.dx) - (b.dx - a.dx) * (c.dy - b.dy);
    if (val == 0) {
      return 0;
    } else if (val < 0) {
      return 2;
    } //anti-clockwise direction
    return 1; //clockwise direction
  }

  static bool _isIntersect(Line l1, Line l2) {
    //four direction for two lines and points of other line
    int dir1 = _direction(l1.p1, l1.p2, l2.p1);
    int dir2 = _direction(l1.p1, l1.p2, l2.p2);
    int dir3 = _direction(l2.p1, l2.p2, l1.p1);
    int dir4 = _direction(l2.p1, l2.p2, l1.p2);

    if (dir1 != dir2 && dir3 != dir4) return true; //they are intersecting
    if (dir1 == 0 && l1.isInside(l2.p1)) //when p2 of line2 are on the line1
      return true;
    if (dir2 == 0 && l1.isInside(l2.p2)) //when p1 of line2 are on the line1
      return true;
    if (dir3 == 0 && l2.isInside(l1.p1)) //when p2 of line1 are on the line2
      return true;
    if (dir4 == 0 && l2.isInside(l1.p2)) //when p1 of line1 are on the line2
      return true;
    return false;
  }

  static bool checkInside(List<Offset> poly, Offset p, Paint paint) {
    int n = poly.length;
    if (n < 3) {
      return false;
    } //when polygon has less than 3 edge, it is not polygon
    Line exline = Line(p, Offset(9999, p.dy)); //create a point at infinity, y is same as point p
    int count = 0;
    int i = 0;
    do {
      //forming a line from two consecutive points of poly
      Line side = Line(poly[i], poly[(i + 1) % n], paint: paint);
      if (_isIntersect(side, exline)) {
        //if side is intersects exline
        if (_direction(side.p1, p, side.p2) == 0) return side.isInside(p);
        count++;
      }
      i = (i + 1) % n;
    } while (i != 0);
    return count % 2 == 1; //when count is odd
  }
}
