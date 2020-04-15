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
    var left = rect.left , right = rect.right , top = rect.top , bottom = rect.bottom ;
    double extraWidth = paint.strokeWidth/2 ;
    bool insideOuterRect = _isInsideRect( p , Rect.fromLTRB(left - extraWidth, top-extraWidth, right + extraWidth, bottom+extraWidth));
    if(paint.style==PaintingStyle.fill){
      return insideOuterRect ;
    }
    else{
      bool outsideInnerRect = !_isInsideRect( p , Rect.fromLTRB(left + extraWidth, top+extraWidth, right - extraWidth, bottom-extraWidth));
      return insideOuterRect && outsideInnerRect ;
    }
  }

  bool _isInsideRect(Offset p , Rect rect){
    var x = p.dx , y = p.dy  ;
    return (x >= rect.bottomLeft.dx && x <= rect.topRight.dx && y >= rect.topLeft.dy  && y <= rect.bottomLeft.dy) ;
  }
}

