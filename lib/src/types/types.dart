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

/// Changes how [PaintingStyle.stroke] affects hit behavior
enum StrokeHitBehavior {
  /// A hit is recorded only when the point actually touches the painted area
  onlyOnPaint,

  /// A hit is recorded when the point is within the bounds of the painted
  /// shape, even if that area is actually transparent
  withinBounds
}
