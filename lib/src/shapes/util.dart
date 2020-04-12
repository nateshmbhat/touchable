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
      case GestureType.onTapDown: return ()=>shape.onTapDown?.call(detail) ;
      case GestureType.onTapUp: return ()=>shape.onTapUp?.call(detail) ;
      case GestureType.onHorizontalDragDown: return ()=>shape.onHorizontalDragDown?.call(detail) ;
      case GestureType.onHorizontalDragStart: return ()=>shape.onHorizontalDragStart?.call(detail) ;
      case GestureType.onHorizontalDragUpdate: return ()=>shape.onHorizontalDragUpdate?.call(detail) ;
      case GestureType.onVerticalDragDown: return ()=>shape.onVerticalDragDown?.call(detail) ;
      case GestureType.onVerticalDragStart: return ()=>shape.onVerticalDragStart?.call(detail) ;
      case GestureType.onVerticalDragUpdate: return ()=>shape.onVerticalDragUpdate?.call(detail) ;
      case GestureType.onLongPressStart: return ()=>shape.onLongPressStart?.call(detail) ;
      case GestureType.onLongPressEnd: return ()=>shape.onLongPressEnd?.call(detail) ;
      case GestureType.onLongPressMoveUpdate: return ()=>shape.onLongPressMoveUpdate?.call(detail) ;
      case GestureType.onScaleStart: return ()=>shape.onScaleStart?.call(detail) ;
      case GestureType.onScaleUpdate: return ()=>shape.onScaleUpdate?.call(detail) ;
      case GestureType.onForcePressStart: return ()=>shape.onForcePressStart?.call(detail) ;
      case GestureType.onForcePressEnd: return ()=>shape.onForcePressEnd?.call(detail) ;
      case GestureType.onForcePressPeak: return ()=>shape.onForcePressPeak?.call(detail) ;
      case GestureType.onForcePressUpdate: return ()=>shape.onForcePressUpdate?.call(detail) ;
      case GestureType.onPanStart: return ()=>shape.onPanStart?.call(detail) ;
      case GestureType.onPanUpdate: return ()=>shape.onPanUpdate?.call(detail) ;
      case GestureType.onPanDown: return ()=>shape.onPanDown?.call(detail) ;
      case GestureType.onSecondaryTapDown: return ()=>shape.onSecondaryTapDown?.call(detail) ;
      case GestureType.onSecondaryTapUp: return ()=>shape.onSecondaryTapUp?.call(detail) ;
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
      case DragUpdateDetails:
        return (gestureDetail as DragUpdateDetails).localPosition;
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
        throw Exception("gestureDetail.runTimeType = ${gestureDetail.runtimeType} is not recognized ! ");
    }
  }
}
