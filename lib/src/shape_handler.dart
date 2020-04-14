// Created by nateshmbhat on 12,April,2020


import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:touchable/src/shapes/clip.dart';
import 'package:touchable/src/shapes/shape.dart';
import 'package:touchable/src/shapes/util.dart';
import 'package:touchable/src/types/types.dart';

class ShapeHandler{
  final List<Shape>  _shapeStack = [] ;
  final List<ClipShapeItem> clipItems = [];
  final Set<GestureType> _registeredGestures = Set() ;

  Set<GestureType> get registeredGestures => _registeredGestures;

  void addShape(Shape shape){
    if(shape is ClipShape){
      clipItems.add(ClipShapeItem(shape,_shapeStack.length));
    }
    else{
      _shapeStack.add(shape) ;
      _registeredGestures.addAll(shape.registeredGestures) ;
    }
  }

  /// STK   CLIPSTK
  ///| 3 |
  /// push clip --->
  ///| 2 |        |   |
  ///| 1 |        |   |
  ///|_0_|        |_3_|
  ///
  /// Looking at above diagram , given the stack position 3 , this function returns all ClipShapes that are pushed before 3 into the clip stack.
  List<ClipShape> _getClipShapesBelowPosition(int position){
   return clipItems.where((element) => element.position <= position).map((e) => e.clipShape).toList();
  }

  ///returns [true] if point lies inside all the clipShapes
  bool _isPointInsideClipShapes(List<ClipShape> clipShapes,Offset point){
    for(int i =0 ;i<clipShapes.length ; i++){
      if(!clipShapes[i].isInside(point)) return false;
    }
    return true ;
  }

  Shape _getTopShapeBelowTouchPoint(Offset point){
    for(int i = _shapeStack.length-1 ; i>=0 ; i--){
      if(_shapeStack[i].isInside(point)){
        if(_isPointInsideClipShapes(_getClipShapesBelowPosition(i), point) == false) return null;
        return _shapeStack[i] ;
      }
    }
    return null ;
  }

  Future<void> handleGestureEvent(Gesture gesture) async {
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
 