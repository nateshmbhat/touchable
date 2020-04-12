// Created by nateshmbhat on 04,April,2020

import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:touchable/src/shapes/constant.dart';
import 'package:touchable/touchable.dart';

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
  bool isRegistered(GestureType gestureType){
    switch(gestureType){
      case GestureType.onTapDown: return onTapDown!=null ;
      case GestureType.onTapUp: return onTapUp!=null ;
      case GestureType.onHorizontalDragDown: return onHorizontalDragDown!=null ;
      case GestureType.onHorizontalDragStart: return onHorizontalDragStart!=null ;
      case GestureType.onHorizontalDragUpdate: return onHorizontalDragUpdate!=null ;
      case GestureType.onVerticalDragDown: return onVerticalDragDown!=null ;
      case GestureType.onVerticalDragStart: return onVerticalDragStart!=null ;
      case GestureType.onVerticalDragUpdate: return onVerticalDragUpdate!=null ;
      case GestureType.onLongPressStart: return onLongPressStart!=null ;
      case GestureType.onLongPressEnd: return onLongPressEnd!=null ;
      case GestureType.onLongPressMoveUpdate: return onLongPressMoveUpdate!=null ;
      case GestureType.onScaleStart: return onScaleStart!=null ;
      case GestureType.onScaleUpdate: return onScaleUpdate!=null ;
      case GestureType.onForcePressStart: return onForcePressStart!=null ;
      case GestureType.onForcePressEnd: return onForcePressEnd!=null ;
      case GestureType.onForcePressPeak: return onForcePressPeak!=null ;
      case GestureType.onForcePressUpdate: return onForcePressUpdate!=null ;
      case GestureType.onPanStart: return onPanStart!=null ;
      case GestureType.onPanUpdate: return onPanUpdate!=null ;
      case GestureType.onPanDown: return onPanDown!=null ;
      case GestureType.onSecondaryTapDown: return onSecondaryTapDown!=null ;
      case GestureType.onSecondaryTapUp: return onSecondaryTapUp!=null ;
      default : return false;
    }
  }
}
