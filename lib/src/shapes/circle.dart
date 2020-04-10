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
    myPrinter("val = ${pow(p.dx - center.dx, 2) + pow(p.dy - center.dy, 2) - pow(radius, 2)}",paint);
    if(paint.strokeWidth==ShapeConstant.floatPrecision){
      return pow(p.dx - center.dx, 2) + pow(p.dy - center.dy, 2) - pow(radius, 2) <= ShapeConstant.floatPrecision ;
    }
    else{
      double extraWidth= paint.strokeWidth/2 ;
      myPrinter("val inside outer circle  = ${pow(p.dx - center.dx, 2) + pow(p.dy - center.dy, 2) - pow(radius+extraWidth, 2)}" ,paint);
      myPrinter("val outside inner circle= ${pow(p.dx - center.dx, 2) + pow(p.dy - center.dy, 2) - pow(radius-extraWidth, 2)}",paint);

      bool insideOuterCircle = pow(p.dx - center.dx, 2) + pow(p.dy - center.dy, 2) - pow(radius + extraWidth , 2) <= ShapeConstant.floatPrecision ;
      bool outsideInnerCircle = pow(p.dx - center.dx, 2) + pow(p.dy - center.dy, 2) - pow(radius - extraWidth , 2) >= ShapeConstant.floatPrecision ;
      if(paint.style==PaintingStyle.fill){
        return insideOuterCircle ;
      }
      else{
        return insideOuterCircle && outsideInnerCircle ;
      }
    }
  }

  myPrinter(String val,Paint paint){
    if(paint.strokeWidth>=5){
     print(val) ;
    }
  }
}

 