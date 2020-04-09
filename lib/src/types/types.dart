// Created by nateshmbhat on 09,April,2020

import 'dart:async';

import 'package:flutter/material.dart';

typedef CustomTouchPaintBuilder = CustomPaint Function(
    BuildContext context, StreamController<Gesture> touchController);

class Gesture {
  final dynamic gestureDetail;

  final GestureType gestureType;

  Gesture(this.gestureType, this.gestureDetail);
}

enum GestureType {
  onTapDown,
  onTapUp,
  onHorizontalDragDown,
  onHorizontalDragStart,
  onHorizontalDragUpdate,
  onVerticalDragDown,
  onVerticalDragStart,
  onVerticalDragUpdate,
  onLongPressStart,
  onLongPressEnd,
  onLongPressMoveUpdate,
  onScaleStart,
  onScaleUpdate,
  onForcePressStart,
  onForcePressEnd,
  onForcePressPeak,
  onForcePressUpdate,
  onPanStart,
  onPanUpdate,
  onPanDown,
  onSecondaryTapDown,
  onSecondaryTapUp,
}
