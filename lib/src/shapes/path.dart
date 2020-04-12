// Created by nateshmbhat on 12,April,2020

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:touchable/src/shapes/shape.dart';

class PathShape extends Shape {
  final Path path;

  PathShape(this.path, {Paint paint, GestureTapDownCallback onTapDown})
      : super(paint: paint, onTapDown: onTapDown);

  @override
  bool isInside(Offset p) {
    return path.contains(p) ;
  }
}
