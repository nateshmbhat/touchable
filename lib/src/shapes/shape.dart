// Created by nateshmbhat on 04,April,2020

import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:touchable/src/shapes/constant.dart';
import 'package:touchable/touchable.dart';

abstract class Shape {
  Paint paint;
  Map<GestureType, Function> gestureCallbackMap;

  Set<GestureType> get registeredGestures => gestureCallbackMap?.keys?.toSet() ?? Set();

  Shape({
    @required this.paint,
    @required this.gestureCallbackMap,
  }) {
    paint ??= Paint()
      ..strokeWidth = ShapeConstant.floatPrecision
      ..style = PaintingStyle.fill;
    gestureCallbackMap ??= Map();
  }

  bool isInside(Offset p);

  Function getCallbackFromGesture(Gesture gesture){
    if(gestureCallbackMap.containsKey(gesture.gestureType)){
      return ()=> gestureCallbackMap[gesture.gestureType](gesture.gestureDetail) ;
    }
    else{
      return (){};
    }
  }
}
