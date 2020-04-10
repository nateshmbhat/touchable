import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:touchable/src/shapes/constant.dart';
import 'package:touchable/src/shapes/shape.dart';
import 'package:touchable/src/shapes/util.dart';
import 'package:flutter/material.dart' ;

/// Created by nateshmbhat on 04,April,2020

class Circle extends Shape {
  final Offset center;
  final double radius;

  Circle({@required this.center, @required this.radius, GestureTapDownCallback onTapDown, Paint paint})
      :super(onTapDown: onTapDown, paint : paint);

//   (x-a)^2 + (y-b)^2 = r^2

  @override
  bool isInside(Offset p) {
    if(paint.strokeWidth==ShapeConstant.floatPrecision){
      return _isInsideRadius(p, radius);
    }
    else{
      double extraWidth= paint.strokeWidth/2 ;
      bool insideOuterCircle = _isInsideRadius(p, radius+extraWidth);
      if(paint.style==PaintingStyle.fill){
        return insideOuterCircle ;
      }
      else{
        bool outsideInnerCircle = _isOutsideRadius(p, radius-extraWidth);
        return insideOuterCircle && outsideInnerCircle ;
      }
    }
  }

  bool _isInsideRadius( Offset p, double radius){
    return pow(p.dx - center.dx, 2) + pow(p.dy - center.dy, 2) - pow(radius, 2) <= ShapeConstant.floatPrecision ;
  }
  bool _isOutsideRadius(Offset p, double radius){
    return pow(p.dx - center.dx, 2) + pow(p.dy - center.dy, 2) - pow(radius, 2) >= ShapeConstant.floatPrecision ;
  }

  myPrinter(String val,Paint paint){
    if(paint.strokeWidth>=5){
     print(val) ;
    }
  }
}

 