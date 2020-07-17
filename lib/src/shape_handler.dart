import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:touchable/src/shapes/clip.dart';
import 'package:touchable/src/shapes/shape.dart';
import 'package:touchable/src/shapes/util.dart';
import 'package:touchable/src/types/types.dart';

class ShapeHandler {
  List<Shape> _shapeStack = [];
  List<ClipShapeItem> _clipItems = [];
  Set<GestureType> _registeredGestures = Set();
  final Matrix4 matrix = Matrix4.identity();

  Set<GestureType> get registeredGestures => _registeredGestures;
  ShapeHandler._initializer(this._shapeStack, this._clipItems, this._registeredGestures);
  ShapeHandler() ;

  ShapeHandler clone(){
    var newHandler = ShapeHandler._initializer(_shapeStack, _clipItems, _registeredGestures) ;
    return newHandler ;
  }

  void addShape(Shape shape) {
    print('Matrix is :\n $matrix');
    shape.transform(matrix) ;
    if (shape is ClipShape) {
      _clipItems.add(ClipShapeItem(shape, _shapeStack.length));
    } else {
      _shapeStack.add(shape);
      _registeredGestures.addAll(shape.registeredGestures);
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
  List<ClipShape> _getClipShapesBelowPosition(int position) {
    return _clipItems
        .where((element) => element.position <= position)
        .map((e) => e.clipShape)
        .toList();
  }

  ///returns [true] if point lies inside all the clipShapes
  bool _isPointInsideClipShapes(List<ClipShape> clipShapes, Offset point) {
    for (int i = 0; i < clipShapes.length; i++) {
      if (!clipShapes[i].isInside(point)) return false;
    }
    return true;
  }

  List<Shape> _getTouchedShapes(Offset point) {
    var selectedShapes = <Shape>[];
    for (int i = _shapeStack.length - 1; i >= 0; i--) {
      var shape = _shapeStack[i];
      if (shape.hitTestBehavior == HitTestBehavior.deferToChild) {
        continue;
      }
      if (shape.isInside(point)) {
        if (_isPointInsideClipShapes(_getClipShapesBelowPosition(i), point) ==
            false) {
          if (shape.hitTestBehavior == HitTestBehavior.opaque) {
            return selectedShapes;
          }
          continue;
        }
        selectedShapes.add(shape);
        if (shape.hitTestBehavior == HitTestBehavior.opaque) {
          return selectedShapes;
        }
      }
    }
    return selectedShapes;
  }

  Future<void> handleGestureEvent(Gesture gesture) async {
    var touchPoint =
        TouchCanvasUtil.getPointFromGestureDetail(gesture.gestureDetail);
    if (!_registeredGestures.contains(gesture.gestureType)) return;

    var touchedShapes = _getTouchedShapes(touchPoint);
    if (touchedShapes.isEmpty) return;
    for (var touchedShape in touchedShapes) {
      if (touchedShape.registeredGestures.contains(gesture.gestureType)) {
        var callback = touchedShape.getCallbackFromGesture(gesture);
        callback();
      }
    }
  }

  void translate(double dx, double dy) {
    matrix.translate(dx,dy) ;
  }

  void rotate(double radians) {
    matrix.rotateZ(radians) ;
  }

  void scale(double sx, [double sy]) {
   matrix.scale(sx,sy) ;
  }
}
