// Created by nateshmbhat on 04,April,2020

import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';

class ShapeUtil {
  static double distance(Offset p1, Offset p2) {
    return sqrt(pow(p2.dy - p1.dy, 2) + pow(p2.dx - p1.dx, 2));
  }
}

class TouchCanvasUtil {
  static Offset getPointFromGestureEvent(dynamic event) {
    switch (event.runtimeType) {
      case TapDownDetails:
        return (event as TapDownDetails).localPosition;
      case TapUpDetails:
        return (event as TapUpDetails).localPosition;
      case DragDownDetails:
        return (event as DragDownDetails).localPosition;
      case DragStartDetails:
        return (event as DragStartDetails).localPosition;
      case LongPressStartDetails:
        return (event as LongPressStartDetails).localPosition;
      case LongPressEndDetails:
        return (event as LongPressEndDetails).localPosition;
      case LongPressMoveUpdateDetails:
        return (event as LongPressMoveUpdateDetails).localPosition;

      case ScaleStartDetails:
        return (event as ScaleStartDetails).localFocalPoint;
      case ScaleUpdateDetails:
        return (event as ScaleUpdateDetails).localFocalPoint;

      case ForcePressDetails:
        return (event as ForcePressDetails).localPosition;

      default:
        throw Exception("event.runTimeType is not recognized ! ");
    }
  }
}
