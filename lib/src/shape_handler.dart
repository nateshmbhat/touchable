// Created by nateshmbhat on 12,April,2020


import 'dart:ui';

import 'package:touchable/src/shapes/shape.dart';
import 'package:touchable/src/shapes/util.dart';
import 'package:touchable/src/types/types.dart';

class ShapeHandler{
  final List<Shape>  _shapeStack = [] ;
  final Set<GestureType> _registeredGestures = Set() ;

  Set<GestureType> get registeredGestures => _registeredGestures;

  void addShape(Shape shape){
   _shapeStack.add(shape) ;
   _registeredGestures.addAll(shape.registeredGestures) ;
  }

  void _addClip(){

  }

  Shape _getTopShapeBelowTouchPoint(Offset point){
    for(int i = _shapeStack.length-1 ; i>=0 ; i--){
      if(_shapeStack[i].isInside(point)){
        return _shapeStack[i] ;
      }
    }
    return null ;
  }
  
  void handleGestureEvent(Gesture gesture){
    var touchPoint = TouchCanvasUtil.getPointFromGestureDetail(gesture.gestureDetail) ;
    if(!_registeredGestures.contains(gesture.gestureType)) return ;

    var touchedShape = _getTopShapeBelowTouchPoint(touchPoint);
    if(touchedShape==null) return ;
    if(touchedShape.registeredGestures.contains(gesture.gestureType)){
      var callback = TouchCanvasUtil.getCallbackFromGesture(touchedShape, gesture);
      callback() ;
    }
  }
}
 