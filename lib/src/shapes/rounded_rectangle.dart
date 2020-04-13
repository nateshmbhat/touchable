// Created by nateshmbhat on 12,April,2020

import 'dart:ui';

import 'package:touchable/src/shapes/shape.dart';

class RoundedRectangle extends Shape {
  final RRect rRect;

  RoundedRectangle(this.rRect, {Paint paint}) : super(paint: paint);

  @override
  bool isInside(Offset p) {
    return rRect.contains(p);
  }
}
