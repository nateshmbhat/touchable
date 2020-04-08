import 'package:flutter/cupertino.dart';
import 'package:matter/src/shapes/constant.dart';
import 'package:matter/src/shapes/shape.dart';
import 'package:matter/src/shapes/util.dart';
import 'package:meta/meta.dart';

/// Created by nateshmbhat on 04,April,2020

class Line extends Shape {
  final Offset p1;
  final Offset p2;
  Line(this.p1, this.p2, { GestureTapDownCallback onTapDown , Paint paint }):super(onTapDown:onTapDown ,paint:paint);

//  y - mx - c
  bool isInside(Offset p) {
    var dist = ShapeUtil.distance(p1,p) + ShapeUtil.distance(p, p2 )  - ShapeUtil.distance(p1, p2);
    return  -paint.strokeWidth < dist && dist < paint.strokeWidth;
  }
}
