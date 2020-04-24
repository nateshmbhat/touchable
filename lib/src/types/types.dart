import 'package:flutter/material.dart';
import 'package:touchable/src/shapes/clip.dart';

typedef CustomTouchPaintBuilder = CustomPaint Function(BuildContext context);

class Gesture {
  final dynamic gestureDetail;

  final GestureType gestureType;

  Gesture(this.gestureType, this.gestureDetail);
}

class ClipShapeItem {
  final ClipShape clipShape;
  final int position;

  ClipShapeItem(this.clipShape, this.position);
}

enum GestureType {
  onTapDown,
  onTapUp,
  onHorizontalDragDown,
  onHorizontalDragStart,
  onHorizontalDragUpdate,
  onVerticalDragDown,
  onVerticalDragStart,
  onVerticalDragUpdate,
  onLongPressStart,
  onLongPressEnd,
  onLongPressMoveUpdate,
  onScaleStart,
  onScaleUpdate,
  onForcePressStart,
  onForcePressEnd,
  onForcePressPeak,
  onForcePressUpdate,
  onPanStart,
  onPanUpdate,
  onPanDown,
  onSecondaryTapDown,
  onSecondaryTapUp,
}
