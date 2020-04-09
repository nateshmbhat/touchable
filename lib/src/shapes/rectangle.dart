// Created by nateshmbhat on 05,April,2020

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:touchable/src/shapes/shape.dart';

class Rectangle extends Shape{

  final Rect rect ;
  Rectangle(this.rect , {GestureTapDownCallback onTapDown , Paint paint  }):super(onTapDown:onTapDown ,paint:paint);

  @override
  bool isInside(Offset p) {
    return rect.contains(p);
//    var x = p.dx , y = p.dy  ;
//    return (x >= rect.bottomLeft.dx && x <= rect.topRight.dx && y >= rect.topLeft.dy  && y <= rect.bottomLeft.dy) ;
  }
}

 