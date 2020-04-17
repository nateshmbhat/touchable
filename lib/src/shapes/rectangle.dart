// Created by nateshmbhat on 05,April,2020

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:touchable/src/shapes/shape.dart';
import 'package:touchable/src/types/types.dart';

class Rectangle extends Shape{
  final Rect rect ;
  Rectangle(this.rect , {
    Map<GestureType,Function> gestureMap , Paint paint})
      :super(paint : paint,gestureCallbackMap:gestureMap);

  @override
  bool isInside(Offset p) {
    if(paint.style==PaintingStyle.fill){
      return rect.contains(p);
    }
    else{
      double extraWidth = paint.strokeWidth / 2;

      bool insideOuterRect = Rect.fromLTRB(
          rect.left - extraWidth, rect.top - extraWidth,
          rect.right + extraWidth, rect.bottom + extraWidth).contains(p);

      bool outsideInnerRect = !Rect.fromLTRB(
          rect.left + extraWidth, rect.top + extraWidth,
          rect.right - extraWidth, rect.bottom - extraWidth).contains(p);
      return insideOuterRect && outsideInnerRect;
    }
  }
}

