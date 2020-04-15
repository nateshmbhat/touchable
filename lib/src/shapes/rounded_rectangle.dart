// Created by nateshmbhat on 12,April,2020

import 'dart:ui';

import 'package:touchable/src/shapes/shape.dart';
import 'package:touchable/src/types/types.dart';

class RoundedRectangle extends Shape {
  final RRect rRect;

  RoundedRectangle(this.rRect, {Paint paint , Map<GestureType,Function> gestureMap }) : super(paint: paint,gestureCallbackMap:gestureMap);

  ///TODO : handle strokewidth and stroke style cases
  @override
  bool isInside(Offset p) {
    return rRect.contains(p);
  }
}
