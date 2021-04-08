import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:touchable/src/shapes/shape.dart';
import 'package:touchable/src/types/types.dart';

class RoundedRectangle extends Shape {
  final RRect rRect;

  RoundedRectangle(this.rRect,
      {Paint? paint,
      Map<GestureType, Function>? gestureMap,
      HitTestBehavior? hitTestBehavior,
      PaintingStyle? paintStyleForTouch})
      : super(hitTestBehavior: hitTestBehavior, paint: paint ?? Paint(), gestureCallbackMap: gestureMap ?? {});

  @override
  bool isInside(Offset p) {
    if (paint.style == PaintingStyle.fill) {
      return rRect.contains(p);
    } else {
      var extraWidth = paint.strokeWidth / 2;
      bool insideOuterRect = RRect.fromLTRBAndCorners(
        rRect.left - extraWidth,
        rRect.top - extraWidth,
        rRect.right + extraWidth,
        rRect.bottom + extraWidth,
        topLeft: Radius.elliptical(rRect.tlRadiusX + extraWidth, rRect.tlRadiusY + extraWidth),
        topRight: Radius.elliptical(rRect.trRadiusX + extraWidth, rRect.trRadiusY + extraWidth),
        bottomLeft: Radius.elliptical(rRect.blRadiusX + extraWidth, rRect.blRadiusY + extraWidth),
        bottomRight: Radius.elliptical(rRect.brRadiusX + extraWidth, rRect.brRadiusY + extraWidth),
      ).contains(p);
      bool outsideInnerRect = !RRect.fromLTRBAndCorners(
        rRect.left + extraWidth,
        rRect.top + extraWidth,
        rRect.right - extraWidth,
        rRect.bottom - extraWidth,
        topLeft: Radius.elliptical(rRect.tlRadiusX - extraWidth, rRect.tlRadiusY - extraWidth),
        topRight: Radius.elliptical(rRect.trRadiusX - extraWidth, rRect.trRadiusY - extraWidth),
        bottomLeft: Radius.elliptical(rRect.blRadiusX - extraWidth, rRect.blRadiusY - extraWidth),
        bottomRight: Radius.elliptical(rRect.brRadiusX - extraWidth, rRect.brRadiusY - extraWidth),
      ).contains(p);
      return insideOuterRect && outsideInnerRect;
    }
  }
}
