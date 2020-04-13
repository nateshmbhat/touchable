// Created by nateshmbhat on 13,April,2020

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:touchable/src/shapes/shape.dart';

abstract class ClipShape extends Shape {
  final bool doAntiAlias;
  ClipShape({this.doAntiAlias = true});
}

class ClipRect extends ClipShape {
  final Rect rect ;
  final ClipOp clipOp ;
  ClipRect(this.rect, { this.clipOp = ClipOp.intersect, bool doAntiAlias}) : super(doAntiAlias: doAntiAlias);

  @override
  bool isInside(Offset p) {
    if(clipOp==ClipOp.intersect){
      return rect.contains(p);
    }
    else if(clipOp==ClipOp.difference){
      return !rect.contains(p);
    }
    return true ;
  }
}

class ClipRRect extends ClipShape{
  final RRect rrect ;
  ClipRRect(this.rrect, {bool doAntiAlias}):super(doAntiAlias:doAntiAlias);
  @override
  bool isInside(Offset p) {
    return rrect.contains(p);
  }
}

class ClipPath extends ClipShape{
  final Path path ;
  ClipPath(this.path, {bool doAntiAlias}):super(doAntiAlias:doAntiAlias);

  @override
  bool isInside(Offset p) {
    return path.contains(p);
  }
}
