import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:touchable/src/types/types.dart';

class ShapeUtil {
  static double distance(Offset p1, Offset p2) {
    return sqrt(pow(p2.dy - p1.dy, 2) + pow(p2.dx - p1.dx, 2));
  }
}

typedef gestureCallback = void Function();

class TouchCanvasUtil {
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

  static Map<GestureType, Function> getGestureCallbackMap({
    required GestureTapDownCallback? onTapDown,
    required GestureTapUpCallback? onTapUp,
    required GestureLongPressStartCallback? onLongPressStart,
    required GestureLongPressEndCallback? onLongPressEnd,
    required GestureLongPressMoveUpdateCallback? onLongPressMoveUpdate,
    required GestureForcePressStartCallback? onForcePressStart,
    required GestureForcePressEndCallback? onForcePressEnd,
    required GestureForcePressPeakCallback? onForcePressPeak,
    required GestureForcePressUpdateCallback? onForcePressUpdate,
    required GestureDragStartCallback? onPanStart,
    required GestureDragUpdateCallback? onPanUpdate,
    required GestureDragDownCallback? onPanDown,
    required GestureTapDownCallback? onSecondaryTapDown,
    required GestureTapUpCallback? onSecondaryTapUp,
  }) {
    var map = <GestureType, Function>{};
    if (onTapDown != null) {
      map.putIfAbsent(GestureType.onTapDown, () => onTapDown);
    }
    if (onTapUp != null) map.putIfAbsent(GestureType.onTapUp, () => onTapUp);

    if (onLongPressStart != null) {
      map.putIfAbsent(GestureType.onLongPressStart, () => onLongPressStart);
    }
    if (onLongPressMoveUpdate != null) {
      map.putIfAbsent(GestureType.onLongPressMoveUpdate, () => onLongPressMoveUpdate);
    }
    if (onLongPressEnd != null) {
      map.putIfAbsent(GestureType.onLongPressEnd, () => onLongPressEnd);
    }

    if (onForcePressStart != null) {
      map.putIfAbsent(GestureType.onForcePressStart, () => onForcePressStart);
    }
    if (onForcePressEnd != null) {
      map.putIfAbsent(GestureType.onForcePressEnd, () => onForcePressEnd);
    }
    if (onForcePressUpdate != null) {
      map.putIfAbsent(GestureType.onForcePressUpdate, () => onForcePressUpdate);
    }
    if (onForcePressPeak != null) {
      map.putIfAbsent(GestureType.onForcePressPeak, () => onForcePressPeak);
    }

    if (onPanStart != null) {
      map.putIfAbsent(GestureType.onPanStart, () => onPanStart);
    }
    if (onPanUpdate != null) {
      map.putIfAbsent(GestureType.onPanUpdate, () => onPanUpdate);
    }
    if (onPanDown != null) {
      map.putIfAbsent(GestureType.onPanDown, () => onPanDown);
    }

    if (onSecondaryTapDown != null) {
      map.putIfAbsent(GestureType.onSecondaryTapDown, () => onSecondaryTapDown);
    }
    if (onSecondaryTapUp != null) {
      map.putIfAbsent(GestureType.onSecondaryTapUp, () => onSecondaryTapUp);
    }

    return map;
  }
}
