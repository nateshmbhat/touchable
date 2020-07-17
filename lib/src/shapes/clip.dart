import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:touchable/src/shapes/shape.dart';

abstract class ClipShape extends Shape {}

class ClipRectShape extends ClipShape {
  final Rect rect;
  final ClipOp clipOp;
  ClipRectShape(this.rect, {this.clipOp = ClipOp.intersect, bool doAntiAlias});

  @override
  bool isInside(Offset p) {
    if (clipOp == ClipOp.intersect) {
      return rect.contains(p);
    } else if (clipOp == ClipOp.difference) {
      return !rect.contains(p);
    }
    return true;
  }

  @override
  void transform(Matrix4 matrix) {
    // TODO: implement transform
  }
}

class ClipRRectShape extends ClipShape {
  final RRect rrect;
  ClipRRectShape(this.rrect, {bool doAntiAlias});
  @override
  bool isInside(Offset p) {
    return rrect.contains(p);
  }

  @override
  void transform(Matrix4 matrix) {
  }
}

class ClipPathShape extends ClipShape {
  final Path path;
  ClipPathShape(this.path, {bool doAntiAlias});

  @override
  bool isInside(Offset p) {
    return path.contains(p);
  }

  @override
  void transform(Matrix4 matrix) {
    // TODO: implement transform
  }
}
