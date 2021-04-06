import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:touchable/src/shapes/shape.dart';

abstract class ClipShape extends Shape {
  ClipShape() : super(paint: Paint(), gestureCallbackMap: {});
}

class ClipRectShape extends ClipShape {
  final Rect rect;
  final ClipOp clipOp;

  ClipRectShape(this.rect, {this.clipOp = ClipOp.intersect});

  @override
  bool isInside(Offset p) {
    if (clipOp == ClipOp.intersect) {
      return rect.contains(p);
    } else if (clipOp == ClipOp.difference) {
      return !rect.contains(p);
    }
    return true;
  }
}

class ClipRRectShape extends ClipShape {
  final RRect rrect;

  ClipRRectShape(this.rrect);

  @override
  bool isInside(Offset p) {
    return rrect.contains(p);
  }
}

class ClipPathShape extends ClipShape {
  final Path path;

  ClipPathShape(this.path);

  @override
  bool isInside(Offset p) {
    return path.contains(p);
  }
}
