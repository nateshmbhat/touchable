// Created by nateshmbhat on 11,April,2020

import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:touchable/src/shapes/shape.dart';

class Oval extends Shape{
  final Rect rect ;
  double a , b ;
//  x^2/a^2 + y^2/b^2 = 1
  Oval(this.rect , {Paint paint ,onTapDown}):super(paint:paint,onTapDown:onTapDown){
    a = rect.right - rect.center.dx;
    b = rect.center.dy - rect.top ;
  }

  @override
  bool isInside(Offset p) {
    if(a==0 || b==0 ) return false ;

    var extraWidth = paint.strokeWidth/2 ;

    bool insideOuterOval = _isInsideOval(p, extraWidth);
    if(paint.style==PaintingStyle.stroke){
      bool outsideInnerOval =  ! _isInsideOval(p, -extraWidth);
      return insideOuterOval && outsideInnerOval ;
    }
    else{
      return insideOuterOval ;
    }
  }

  _isInsideOval(Offset p , double extraWidth ){
    return pow(p.dx - rect.center.dx ,2)/pow(a+extraWidth,2) + pow(p.dy - rect.center.dy ,2) / pow(b+extraWidth,2) <= 1 ;
  }
}

 