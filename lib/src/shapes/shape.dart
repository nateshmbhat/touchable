// Created by nateshmbhat on 04,April,2020

import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:touchable/src/shapes/constant.dart';

abstract class Shape {
  Paint paint;

  final GestureTapDownCallback onTapDown;
  final GestureTapDownCallback onSecondaryTapDown;

  final GestureTapUpCallback onTapUp;
  final GestureTapDownCallback onSecondaryTapUp;

  final GestureDragDownCallback onHorizontalDragDown;
  final GestureDragDownCallback onVerticalDragDown;
  final GestureDragDownCallback onPanDown;

//  final GestureDragEndCallback dragEndCallback ; // HAS NO LOCAL POSITION
  final GestureDragStartCallback onHorizontalDragStart;
  final GestureDragStartCallback onVerticalDragStart;
  final GestureDragStartCallback onPanStart;

  final GestureDragUpdateCallback onHorizontalDragUpdate;
  final GestureDragUpdateCallback onVerticalDragUpdate;
  final GestureDragUpdateCallback onPanUpdate;

  final GestureLongPressStartCallback onLongPressStart;

  final GestureLongPressEndCallback onLongPressEnd;

  final GestureLongPressMoveUpdateCallback onLongPressMoveUpdate;

  final GestureScaleStartCallback onScaleStart;

//  final GestureScaleEndCallback scaleEndCallback; Has no localPosition
  final GestureScaleUpdateCallback onScaleUpdate;

  final GestureForcePressStartCallback onForcePressStart;

  final GestureForcePressEndCallback onForcePressEnd;

  final GestureForcePressUpdateCallback onForcePressUpdate;

  final GestureForcePressPeakCallback onForcePressPeak;

  Shape({
    this.paint,
    this.onTapDown,
    this.onSecondaryTapDown,
    this.onSecondaryTapUp,
    this.onHorizontalDragDown,
    this.onVerticalDragDown,
    this.onPanDown,
    this.onHorizontalDragStart,
    this.onVerticalDragStart,
    this.onPanStart,
    this.onHorizontalDragUpdate,
    this.onVerticalDragUpdate,
    this.onPanUpdate,
    this.onLongPressStart,
    this.onLongPressEnd,
    this.onLongPressMoveUpdate,
    this.onScaleStart,
    this.onScaleUpdate,
    this.onForcePressStart,
    this.onForcePressEnd,
    this.onForcePressUpdate,
    this.onForcePressPeak,
    this.onTapUp,
  }) {
    paint ??= Paint()
      ..strokeWidth = ShapeConstant.floatPrecision
      ..style = PaintingStyle.fill;
  }

  bool isInside(Offset p);
}
