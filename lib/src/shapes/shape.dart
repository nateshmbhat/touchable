// Created by nateshmbhat on 04,April,2020

import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:matter/src/shapes/constant.dart';

abstract class Shape {
  Paint paint;

  final GestureTapDownCallback onTapDown;

  final GestureTapUpCallback onTapUp;

  final GestureDragDownCallback dragDownCallback;

//  final GestureDragEndCallback dragEndCallback ; // HAS NO LOCAL POSITION
  final GestureDragStartCallback dragStartCallback;

  final GestureDragUpdateCallback dragUpdateCallback;

  final GestureLongPressStartCallback longPressStartCallback;

  final GestureLongPressEndCallback longPressEndCallback;

  final GestureLongPressMoveUpdateCallback longPressMoveUpdateCallback;

  final GestureScaleStartCallback scaleStartCallback;

//  final GestureScaleEndCallback scaleEndCallback; Has no localPosition
  final GestureScaleUpdateCallback scaleUpdateCallback;

  final GestureForcePressStartCallback forcePressStartCallback;

  final GestureForcePressEndCallback forcePressEndCallback;

  final GestureForcePressUpdateCallback forcePressUpdateCallback;

  final GestureForcePressPeakCallback forcePressPeakCallback;

  final GestureMultiTapDownCallback multiTapDownCallback;

  final GestureMultiTapUpCallback multiTapUpCallback;

  Shape(
      {this.paint,
      this.onTapUp,
      this.dragDownCallback,
//      this.dragEndCallback,
      this.dragStartCallback,
      this.dragUpdateCallback,
      this.longPressStartCallback,
      this.longPressEndCallback,
      this.longPressMoveUpdateCallback,
      this.scaleStartCallback,
//      this.scaleEndCallback,
      this.scaleUpdateCallback,
      this.forcePressStartCallback,
      this.forcePressEndCallback,
      this.forcePressUpdateCallback,
      this.forcePressPeakCallback,
      this.multiTapDownCallback,
      this.multiTapUpCallback,
      this.onTapDown}) {
    paint ??= Paint()
      ..strokeWidth = ShapeConstant.floatPrecision
      ..style = PaintingStyle.fill;
  }

  bool isInside(Offset p);
}
