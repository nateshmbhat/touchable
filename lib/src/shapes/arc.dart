// Created by nateshmbhat on 12,April,2020

import 'dart:ui';

import 'package:touchable/src/shapes/shape.dart';

class Arc extends Shape {
  final Rect rect;
  final double startAngle;
  final double sweepAngle;
  final bool useCenter;

  Arc(this.rect, this.startAngle, this.sweepAngle, this.useCenter,
      {Paint paint})
      : super(paint: paint);

  @override
  bool isInside(Offset p) {

  }
}
