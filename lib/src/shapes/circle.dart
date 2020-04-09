import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:touchable/src/shapes/constant.dart';
import 'package:touchable/src/shapes/shape.dart';

/// Created by nateshmbhat on 04,April,2020

class Circle extends Shape {
  final Offset center;
  final double radius;

  Circle({@required this.center, @required this.radius, GestureTapDownCallback onTapDown, Paint paint})
      :super(onTapDown: onTapDown, paint : paint);

//   (x-a)^2 + (y-b)^2 = r^2

  @override
  bool isInside(Offset p) {
    return pow(p.dx - center.dx, 2) + pow(p.dy - center.dy, 2) - pow(radius, 2) <= paint.strokeWidth;
  }
}

 