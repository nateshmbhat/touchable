import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:touchable/src/shapes/shape.dart';
import 'package:touchable/src/types/types.dart';

class PathShape extends Shape {
  final Path path;

  PathShape(this.path,
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
    return path.contains(p);
  }

  @override
  void transform(Matrix4 matrix) {
    // TODO: implement transform
  }
}
