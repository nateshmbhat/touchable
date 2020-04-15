// Created by nateshmbhat on 12,April,2020

import 'dart:ui';

import 'package:touchable/src/shapes/line.dart';
import 'package:touchable/src/shapes/oval.dart';
import 'package:touchable/src/shapes/shape.dart';
import 'dart:math';

import 'package:touchable/src/types/types.dart';

///See https://math.stackexchange.com/questions/3622277/how-to-test-if-a-point-lies-inside-a-segment-of-an-arc-that-is-formed-by-a-recta?noredirect=1#comment7446310_3622277
///for more info on point detection
class Arc extends Shape {
  final Rect rect;
  final double startAngle;
  final double sweepAngle;
  final bool useCenter;

  Oval _oval;

  Offset _arcStartPoint;
  Line _chordLine ;
  Offset _arcEndPoint;

  Arc(this.rect, this.startAngle, this.sweepAngle, this.useCenter,
      {Paint paint , Map<GestureType,Function> gestureMap })
      : super(paint: paint , gestureCallbackMap : gestureMap) {
    _oval = Oval(rect, paint: paint);

    var cosStartAngle = cos(startAngle);
    var startPointPhi = atan2(_oval.a * sin(startAngle), _oval.b * cosStartAngle );
//    give same sign to angle phi as cos(theta)
    if(cosStartAngle>0){
      startPointPhi = startPointPhi > 0 ? startPointPhi : -startPointPhi ;
    }
    else{
      startPointPhi = startPointPhi < 0 ? startPointPhi : -startPointPhi ;
    }
    
    var cosEndAngle = cos(sweepAngle);
    var endPointPhi = atan2(_oval.a * sin(sweepAngle), _oval.b * cosEndAngle);
//    give same sign to angle phi as cos(theta)
    if(cosEndAngle>0){
      endPointPhi = endPointPhi > 0 ? endPointPhi : -endPointPhi ;
    }
    else{
      endPointPhi = endPointPhi < 0 ? endPointPhi : -endPointPhi ;
    }

    _arcStartPoint =  Offset(_oval.a * cos(startPointPhi), _oval.b * cos(startPointPhi));
    _arcEndPoint =  Offset(_oval.a * cos(endPointPhi) , _oval.b * cos(endPointPhi));

    _chordLine = Line(_arcStartPoint,_arcEndPoint);
  }

// TODO : implement below method
  @override
  bool isInside(Offset p) {
    return false;
  }
}
