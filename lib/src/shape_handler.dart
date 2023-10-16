import 'package:flutter/cupertino.dart';
import 'package:touchable/src/shapes/clip.dart';
import 'package:touchable/src/shapes/shape.dart';
import 'package:touchable/src/shapes/util.dart';
import 'package:touchable/src/types/types.dart';

class ShapeHandler {
  Shape? panningShape;
  final List<Shape> _shapeStack = [];
  final List<ClipShapeItem> clipItems = [];
  final Set<GestureType> _registeredGestures = {};

  Set<GestureType> get registeredGestures => _registeredGestures;

  void addShape(Shape shape) {
    if (shape is ClipShape) {
      clipItems.add(ClipShapeItem(shape, _shapeStack.length));
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
    return clipItems.where((element) => element.position <= position).map((e) => e.clipShape).toList();
  }

  ///returns [true] if point lies inside all the clipShapes
  bool _isPointInsideClipShapes(List<ClipShape> clipShapes, Offset point) {
    for (int i = 0; i < clipShapes.length; i++) {
      if (!clipShapes[i].isInside(point)) return false;
    }
    return true;
  }

  Offset _getActualOffsetFromScrollController(Offset touchPoint, ScrollController? controller, AxisDirection direction) {
    if (controller == null) {
      return touchPoint;
    }

    final scrollPosition = controller.position;
    final actualScrollPixels = direction == AxisDirection.left || direction == AxisDirection.up
        ? scrollPosition.maxScrollExtent - scrollPosition.pixels
        : scrollPosition.pixels;

    if (direction == AxisDirection.left || direction == AxisDirection.right) {
      return Offset(touchPoint.dx + actualScrollPixels, touchPoint.dy);
    } else {
      return Offset(touchPoint.dx, touchPoint.dy + actualScrollPixels);
    }
  }

  List<Shape> _getTouchedShapes(Offset point) {
    var selectedShapes = <Shape>[];
    for (int i = _shapeStack.length - 1; i >= 0; i--) {
      var shape = _shapeStack[i];
      if (shape.hitTestBehavior == HitTestBehavior.deferToChild) {
        continue;
      }
      if (shape.isInside(point)) {
        if (_isPointInsideClipShapes(_getClipShapesBelowPosition(i), point) == false) {
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

  Future<void> handleGestureEvent(Gesture gesture, {
    ScrollController? scrollController,
    AxisDirection direction = AxisDirection.down,
  }) async {
    // if (!_registeredGestures.contains(gesture.gestureType)) return;  !!! uncomment
    final panningShapeLocal = panningShape;
    if ((gesture.gestureType == GestureType.onPanEnd ||
            gesture.gestureType == GestureType.onPanCancel) &&
        panningShapeLocal != null) {
      // print('!!! handleGestureEvent - onPanEnd');
      if (panningShapeLocal.registeredGestures.contains(gesture.gestureType)) {
        var callback = panningShapeLocal.getCallbackFromGesture(gesture);
        callback();
      }
      panningShape = null;
    } else if (gesture.gestureType == GestureType.onPanUpdate &&
        panningShapeLocal != null) {

      if (panningShapeLocal.registeredGestures.contains(gesture.gestureType)) {
        var callback = panningShapeLocal.getCallbackFromGesture(gesture);
        callback();
      }

    } else {
      final pointFromGestureDetail = TouchCanvasUtil.getPointFromGestureDetail(gesture.gestureDetail);
      if (pointFromGestureDetail == null) {
        return ;
      }
      final touchPoint = _getActualOffsetFromScrollController(
          pointFromGestureDetail, scrollController, direction);

      var touchedShapes = _getTouchedShapes(touchPoint);
      if (touchedShapes.isEmpty) return;

      outerLoop:
      for (var touchedShape in touchedShapes) {
        if (touchedShape.registeredGestures.contains(gesture.gestureType)) {
          var callback = touchedShape.getCallbackFromGesture(gesture);
          callback();
          if (gesture.gestureType == GestureType.onPanStart) {
            panningShape = touchedShape;
            break outerLoop;
          }
        }
      }
    }
  }
}
