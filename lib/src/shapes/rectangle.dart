import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:touchable/src/shapes/shape.dart';
import 'package:touchable/src/shapes/util.dart';
import 'package:touchable/src/types/types.dart';
import 'package:vector_math/vector_math_64.dart';

class Rectangle extends Shape {
  Rect rect;
  Rectangle(this.rect,
      {Map<GestureType, Function> gestureMap,
      Paint paint,
      HitTestBehavior hitTestBehavior,
      PaintingStyle paintStyleForTouch})
      : super(
            hitTestBehavior: hitTestBehavior,
            paint: paint,
            gestureCallbackMap: gestureMap);

  @override
  bool isInside(Offset p) {
    if (paint.style == PaintingStyle.fill) {
      return rect.contains(p);
    } else {
      double extraWidth = paint.strokeWidth / 2;

      bool insideOuterRect = Rect.fromLTRB(
              rect.left - extraWidth,
              rect.top - extraWidth,
              rect.right + extraWidth,
              rect.bottom + extraWidth)
          .contains(p);

      bool outsideInnerRect = !Rect.fromLTRB(
              rect.left + extraWidth,
              rect.top + extraWidth,
              rect.right - extraWidth,
              rect.bottom - extraWidth)
          .contains(p);
      return insideOuterRect && outsideInnerRect;
    }
  }

  @override
  void transform(Matrix4 matrix) {
    var topLeft = ShapeUtil.getTransformedPoint( rect.topLeft , matrix);
    var bottomRight = ShapeUtil.getTransformedPoint( rect.bottomRight, matrix);
    rect = Rect.fromLTRB(topLeft.dx, topLeft.dy,bottomRight.dx, bottomRight.dy);
  }
}
