import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:touchable/src/shapes/constant.dart';
import 'package:touchable/touchable.dart';

abstract class Shape {
  Paint paint;
  Map<GestureType, Function> gestureCallbackMap;
  HitTestBehavior hitTestBehavior;

  Set<GestureType> get registeredGestures => gestureCallbackMap?.keys?.toSet() ?? Set();

  Shape({
    @required this.paint,
    @required this.gestureCallbackMap,
    this.hitTestBehavior,
  }) {
    paint ??= (Paint()
      ..strokeWidth = ShapeConstant.floatPrecision
      ..style = PaintingStyle.fill);
    if (paint.strokeWidth == 0) {
      paint.strokeWidth = ShapeConstant.floatPrecision;
    }
    hitTestBehavior ??= HitTestBehavior.opaque;
    gestureCallbackMap ??= {};
  }

  bool isInside(Offset p);

  Function getCallbackFromGesture(Gesture gesture) {
    if (gestureCallbackMap.containsKey(gesture.gestureType)) {
      return () => gestureCallbackMap[gesture.gestureType](gesture.gestureDetail);
    } else {
      return () {};
    }
  }
}
