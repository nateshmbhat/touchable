// Created by nateshmbhat on 04,April,2020

import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:touchable/src/shapes/shape.dart';
import 'package:touchable/src/types/types.dart';

class ShapeUtil {
  static double distance(Offset p1, Offset p2) {
    return sqrt(pow(p2.dy - p1.dy, 2) + pow(p2.dx - p1.dx, 2));
  }
}

typedef gestureCallback =  void Function() ; 
class TouchCanvasUtil {
  
  ///This method returns a function whose body contains the function call to the proper callback depending on the [GestureType] and passes the [event.gestureDetail] object accordingly.
  ///This returned function contains the closure to call with the corresponding [gesture.detail] object automatically. 
  ///The caller of this would just call the returned function without any parameters.
  static gestureCallback getCallbackFromGesture(Shape shape , Gesture gesture ){
    var detail = gesture.gestureDetail;
    switch(gesture.gestureType){
      case GestureType.onTapDown: return ()=>shape.onTapDown(detail) ;
      case GestureType.onTapUp: return ()=>shape.onTapUp(detail) ;
      case GestureType.onHorizontalDragDown: return ()=>shape.onHorizontalDragDown(detail) ;
      case GestureType.onHorizontalDragStart: return ()=>shape.onHorizontalDragStart(detail) ;
      case GestureType.onHorizontalDragUpdate: return ()=>shape.onHorizontalDragUpdate(detail) ;
      case GestureType.onVerticalDragDown: return ()=>shape.onVerticalDragDown(detail) ;
      case GestureType.onVerticalDragStart: return ()=>shape.onVerticalDragStart(detail) ;
      case GestureType.onVerticalDragUpdate: return ()=>shape.onVerticalDragUpdate(detail) ;
      case GestureType.onLongPressStart: return ()=>shape.onLongPressStart(detail) ;
      case GestureType.onLongPressEnd: return ()=>shape.onLongPressEnd(detail) ;
      case GestureType.onLongPressMoveUpdate: return ()=>shape.onLongPressMoveUpdate(detail) ;
      case GestureType.onScaleStart: return ()=>shape.onScaleStart(detail) ;
      case GestureType.onScaleUpdate: return ()=>shape.onScaleUpdate(detail) ;
      case GestureType.onForcePressStart: return ()=>shape.onForcePressStart(detail) ;
      case GestureType.onForcePressEnd: return ()=>shape.onForcePressEnd(detail) ;
      case GestureType.onForcePressPeak: return ()=>shape.onForcePressPeak(detail) ;
      case GestureType.onForcePressUpdate: return ()=>shape.onForcePressUpdate(detail) ;
      case GestureType.onPanStart: return ()=>shape.onPanStart(detail) ;
      case GestureType.onPanUpdate: return ()=>shape.onPanUpdate(detail) ;
      case GestureType.onPanDown: return ()=>shape.onPanDown(detail) ;
      case GestureType.onSecondaryTapDown: return ()=>shape.onSecondaryTapDown(detail) ;
      case GestureType.onSecondaryTapUp: return ()=>shape.onSecondaryTapUp(detail) ;
      default:
        return ()=>{} ;
    }
  }
  
  static Offset getPointFromGestureDetail(dynamic gestureDetail) {
    switch (gestureDetail.runtimeType) {
      case TapDownDetails:
        return (gestureDetail as TapDownDetails).localPosition;
      case TapUpDetails:
        return (gestureDetail as TapUpDetails).localPosition;
      case DragDownDetails:
        return (gestureDetail as DragDownDetails).localPosition;
      case DragStartDetails:
        return (gestureDetail as DragStartDetails).localPosition;
      case LongPressStartDetails:
        return (gestureDetail as LongPressStartDetails).localPosition;
      case LongPressEndDetails:
        return (gestureDetail as LongPressEndDetails).localPosition;
      case LongPressMoveUpdateDetails:
        return (gestureDetail as LongPressMoveUpdateDetails).localPosition;

      case ScaleStartDetails:
        return (gestureDetail as ScaleStartDetails).localFocalPoint;
      case ScaleUpdateDetails:
        return (gestureDetail as ScaleUpdateDetails).localFocalPoint;

      case ForcePressDetails:
        return (gestureDetail as ForcePressDetails).localPosition;

      default:
        throw Exception("event.runTimeType is not recognized ! ");
    }
  }
}
