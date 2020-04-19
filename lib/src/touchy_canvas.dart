// Created by nateshmbhat on 05,April,2020
library matter;

import 'dart:async';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart' hide Image;
import 'package:touchable/src/canvas_touch_detector.dart';
import 'package:touchable/src/shape_handler.dart';
import 'package:touchable/src/shapes/arc.dart';
import 'package:touchable/src/shapes/circle.dart';
import 'package:touchable/src/shapes/clip.dart';
import 'package:touchable/src/shapes/line.dart';
import 'package:touchable/src/shapes/oval.dart';
import 'package:touchable/src/shapes/path.dart';
import 'package:touchable/src/shapes/point.dart';
import 'package:touchable/src/shapes/rectangle.dart';
import 'package:touchable/src/shapes/rounded_rectangle.dart';
import 'package:touchable/src/shapes/util.dart';
import 'package:touchable/src/types/types.dart';

class TouchyCanvas {
  final Canvas _canvas;

  StreamController<Gesture> controller;
  final ShapeHandler _shapeHandler = ShapeHandler();

  TouchyCanvas(BuildContext context, this._canvas) {
    controller = TouchDetectionController.of(context).controller;
    if (!controller.hasListener) {
      controller.stream.listen((event) {
        _shapeHandler.handleGestureEvent(event);
      });
    }
  }

  void clipPath(Path path, {bool doAntiAlias = true}) {
    _canvas.clipPath(path, doAntiAlias: doAntiAlias);
    _shapeHandler.addShape(ClipPathShape(path));
  }

  void clipRRect(RRect rrect, {bool doAntiAlias = true}) {
    _canvas.clipRRect(rrect, doAntiAlias: doAntiAlias);
    _shapeHandler.addShape(ClipRRectShape(rrect));
  }

  void clipRect(Rect rect,
      {ClipOp clipOp = ClipOp.intersect, bool doAntiAlias = true}) {
    _canvas.clipRect(rect, clipOp: clipOp, doAntiAlias: doAntiAlias);
    _shapeHandler.addShape(ClipRectShape(rect, clipOp: clipOp));
  }

  void drawCircle(
    Offset c,
    double radius,
    Paint paint, {
    GestureTapDownCallback onTapDown,
    GestureTapUpCallback onTapUp,
    GestureLongPressStartCallback onLongPressStart,
    GestureLongPressEndCallback onLongPressEnd,
    GestureLongPressMoveUpdateCallback onLongPressMoveUpdate,
    GestureForcePressStartCallback onForcePressStart,
    GestureForcePressEndCallback onForcePressEnd,
    GestureForcePressPeakCallback onForcePressPeak,
    GestureForcePressUpdateCallback onForcePressUpdate,
    GestureDragStartCallback onPanStart,
    GestureDragUpdateCallback onPanUpdate,
    GestureDragDownCallback onPanDown,
    GestureTapDownCallback onSecondaryTapDown,
    GestureTapUpCallback onSecondaryTapUp,
  }) {
    _canvas.drawCircle(c, radius, paint);
    _shapeHandler.addShape(Circle(
        center: c,
        radius: radius,
        paint: paint,
        gestureMap: TouchCanvasUtil.getGestureCallbackMap(
          onTapDown: onTapDown,
          onTapUp: onTapUp,
          onLongPressStart: onLongPressStart,
          onLongPressEnd: onLongPressEnd,
          onLongPressMoveUpdate: onLongPressMoveUpdate,
          onForcePressStart: onForcePressStart,
          onForcePressEnd: onForcePressEnd,
          onForcePressPeak: onForcePressPeak,
          onForcePressUpdate: onForcePressUpdate,
          onPanStart: onPanStart,
          onPanUpdate: onPanUpdate,
          onPanDown: onPanDown,
          onSecondaryTapDown: onSecondaryTapDown,
          onSecondaryTapUp: onSecondaryTapUp,
        )));
  }

  void drawLine(
    Offset p1,
    Offset p2,
    Paint paint, {
    GestureTapDownCallback onTapDown,
    GestureTapUpCallback onTapUp,
    GestureLongPressStartCallback onLongPressStart,
    GestureLongPressEndCallback onLongPressEnd,
    GestureLongPressMoveUpdateCallback onLongPressMoveUpdate,
    GestureForcePressStartCallback onForcePressStart,
    GestureForcePressEndCallback onForcePressEnd,
    GestureForcePressPeakCallback onForcePressPeak,
    GestureForcePressUpdateCallback onForcePressUpdate,
    GestureDragStartCallback onPanStart,
    GestureDragUpdateCallback onPanUpdate,
    GestureDragDownCallback onPanDown,
    GestureTapDownCallback onSecondaryTapDown,
    GestureTapUpCallback onSecondaryTapUp,
  }) {
    _canvas.drawLine(p1, p2, paint);
    _shapeHandler.addShape(Line(p1, p2,
        paint: paint,
        gestureMap: TouchCanvasUtil.getGestureCallbackMap(
          onTapDown: onTapDown,
          onTapUp: onTapUp,
          onLongPressStart: onLongPressStart,
          onLongPressEnd: onLongPressEnd,
          onLongPressMoveUpdate: onLongPressMoveUpdate,
          onForcePressStart: onForcePressStart,
          onForcePressEnd: onForcePressEnd,
          onForcePressPeak: onForcePressPeak,
          onForcePressUpdate: onForcePressUpdate,
          onPanStart: onPanStart,
          onPanUpdate: onPanUpdate,
          onPanDown: onPanDown,
          onSecondaryTapDown: onSecondaryTapDown,
          onSecondaryTapUp: onSecondaryTapUp,
        )));
  }

  void drawOval(
    Rect rect,
    Paint paint, {
    GestureTapDownCallback onTapDown,
    GestureTapUpCallback onTapUp,
    GestureLongPressStartCallback onLongPressStart,
    GestureLongPressEndCallback onLongPressEnd,
    GestureLongPressMoveUpdateCallback onLongPressMoveUpdate,
    GestureForcePressStartCallback onForcePressStart,
    GestureForcePressEndCallback onForcePressEnd,
    GestureForcePressPeakCallback onForcePressPeak,
    GestureForcePressUpdateCallback onForcePressUpdate,
    GestureDragStartCallback onPanStart,
    GestureDragUpdateCallback onPanUpdate,
    GestureDragDownCallback onPanDown,
    GestureTapDownCallback onSecondaryTapDown,
    GestureTapUpCallback onSecondaryTapUp,
  }) {
    _canvas.drawOval(rect, paint);
    _shapeHandler.addShape(Oval(rect,
        paint: paint,
        gestureMap: TouchCanvasUtil.getGestureCallbackMap(
          onTapDown: onTapDown,
          onTapUp: onTapUp,
          onLongPressStart: onLongPressStart,
          onLongPressEnd: onLongPressEnd,
          onLongPressMoveUpdate: onLongPressMoveUpdate,
          onForcePressStart: onForcePressStart,
          onForcePressEnd: onForcePressEnd,
          onForcePressPeak: onForcePressPeak,
          onForcePressUpdate: onForcePressUpdate,
          onPanStart: onPanStart,
          onPanUpdate: onPanUpdate,
          onPanDown: onPanDown,
          onSecondaryTapDown: onSecondaryTapDown,
          onSecondaryTapUp: onSecondaryTapUp,
        )));
  }

  void drawParagraph(Paragraph paragraph, Offset offset) {
    _canvas.drawParagraph(paragraph, offset);
    _shapeHandler.addShape(Rectangle(Rect.fromLTWH(
        offset.dx, offset.dy, paragraph.width, paragraph.height)));
  }

  void drawPath(
    Path path,
    Paint paint, {
    GestureTapDownCallback onTapDown,
    GestureTapUpCallback onTapUp,
    GestureLongPressStartCallback onLongPressStart,
    GestureLongPressEndCallback onLongPressEnd,
    GestureLongPressMoveUpdateCallback onLongPressMoveUpdate,
    GestureForcePressStartCallback onForcePressStart,
    GestureForcePressEndCallback onForcePressEnd,
    GestureForcePressPeakCallback onForcePressPeak,
    GestureForcePressUpdateCallback onForcePressUpdate,
    GestureDragStartCallback onPanStart,
    GestureDragUpdateCallback onPanUpdate,
    GestureDragDownCallback onPanDown,
    GestureTapDownCallback onSecondaryTapDown,
    GestureTapUpCallback onSecondaryTapUp,
  }) {
    _canvas.drawPath(path, paint);
    _shapeHandler.addShape(PathShape(path,
        paint: paint,
        gestureMap: TouchCanvasUtil.getGestureCallbackMap(
          onTapDown: onTapDown,
          onTapUp: onTapUp,
          onLongPressStart: onLongPressStart,
          onLongPressEnd: onLongPressEnd,
          onLongPressMoveUpdate: onLongPressMoveUpdate,
          onForcePressStart: onForcePressStart,
          onForcePressEnd: onForcePressEnd,
          onForcePressPeak: onForcePressPeak,
          onForcePressUpdate: onForcePressUpdate,
          onPanStart: onPanStart,
          onPanUpdate: onPanUpdate,
          onPanDown: onPanDown,
          onSecondaryTapDown: onSecondaryTapDown,
          onSecondaryTapUp: onSecondaryTapUp,
        )));
  }

  void drawPoints(
    PointMode pointMode,
    List<Offset> points,
    Paint paint, {
    GestureTapDownCallback onTapDown,
    GestureTapUpCallback onTapUp,
    GestureLongPressStartCallback onLongPressStart,
    GestureLongPressEndCallback onLongPressEnd,
    GestureLongPressMoveUpdateCallback onLongPressMoveUpdate,
    GestureForcePressStartCallback onForcePressStart,
    GestureForcePressEndCallback onForcePressEnd,
    GestureForcePressPeakCallback onForcePressPeak,
    GestureForcePressUpdateCallback onForcePressUpdate,
    GestureDragStartCallback onPanStart,
    GestureDragUpdateCallback onPanUpdate,
    GestureDragDownCallback onPanDown,
    GestureTapDownCallback onSecondaryTapDown,
    GestureTapUpCallback onSecondaryTapUp,
  }) {
    _canvas.drawPoints(pointMode, points, paint);
    _shapeHandler.addShape(Point(pointMode, points,
        paint: paint,
        gestureMap: TouchCanvasUtil.getGestureCallbackMap(
          onTapDown: onTapDown,
          onTapUp: onTapUp,
          onLongPressStart: onLongPressStart,
          onLongPressEnd: onLongPressEnd,
          onLongPressMoveUpdate: onLongPressMoveUpdate,
          onForcePressStart: onForcePressStart,
          onForcePressEnd: onForcePressEnd,
          onForcePressPeak: onForcePressPeak,
          onForcePressUpdate: onForcePressUpdate,
          onPanStart: onPanStart,
          onPanUpdate: onPanUpdate,
          onPanDown: onPanDown,
          onSecondaryTapDown: onSecondaryTapDown,
          onSecondaryTapUp: onSecondaryTapUp,
        )));
  }

  void drawRRect(
    RRect rrect,
    Paint paint, {
    GestureTapDownCallback onTapDown,
    GestureTapUpCallback onTapUp,
    GestureLongPressStartCallback onLongPressStart,
    GestureLongPressEndCallback onLongPressEnd,
    GestureLongPressMoveUpdateCallback onLongPressMoveUpdate,
    GestureForcePressStartCallback onForcePressStart,
    GestureForcePressEndCallback onForcePressEnd,
    GestureForcePressPeakCallback onForcePressPeak,
    GestureForcePressUpdateCallback onForcePressUpdate,
    GestureDragStartCallback onPanStart,
    GestureDragUpdateCallback onPanUpdate,
    GestureDragDownCallback onPanDown,
    GestureTapDownCallback onSecondaryTapDown,
    GestureTapUpCallback onSecondaryTapUp,
  }) {
    _canvas.drawRRect(rrect, paint);
    _shapeHandler.addShape(RoundedRectangle(rrect,
        paint: paint,
        gestureMap: TouchCanvasUtil.getGestureCallbackMap(
          onTapDown: onTapDown,
          onTapUp: onTapUp,
          onLongPressStart: onLongPressStart,
          onLongPressEnd: onLongPressEnd,
          onLongPressMoveUpdate: onLongPressMoveUpdate,
          onForcePressStart: onForcePressStart,
          onForcePressEnd: onForcePressEnd,
          onForcePressPeak: onForcePressPeak,
          onForcePressUpdate: onForcePressUpdate,
          onPanStart: onPanStart,
          onPanUpdate: onPanUpdate,
          onPanDown: onPanDown,
          onSecondaryTapDown: onSecondaryTapDown,
          onSecondaryTapUp: onSecondaryTapUp,
        )));
  }

  void drawRawPoints(
    PointMode pointMode,
    Float32List points,
    Paint paint, {
    GestureTapDownCallback onTapDown,
    GestureTapUpCallback onTapUp,
    GestureLongPressStartCallback onLongPressStart,
    GestureLongPressEndCallback onLongPressEnd,
    GestureLongPressMoveUpdateCallback onLongPressMoveUpdate,
    GestureForcePressStartCallback onForcePressStart,
    GestureForcePressEndCallback onForcePressEnd,
    GestureForcePressPeakCallback onForcePressPeak,
    GestureForcePressUpdateCallback onForcePressUpdate,
    GestureDragStartCallback onPanStart,
    GestureDragUpdateCallback onPanUpdate,
    GestureDragDownCallback onPanDown,
    GestureTapDownCallback onSecondaryTapDown,
    GestureTapUpCallback onSecondaryTapUp,
  }) {
    _canvas.drawRawPoints(pointMode, points, paint);
    List<Offset> offsetPoints = [];
    for (int i = 0; i < points.length; i += 2) {
      offsetPoints.add(Offset(points[i], points[i + 1]));
    }
    _shapeHandler.addShape(Point(pointMode, offsetPoints,
        paint: paint,
        gestureMap: TouchCanvasUtil.getGestureCallbackMap(
          onTapDown: onTapDown,
          onTapUp: onTapUp,
          onLongPressStart: onLongPressStart,
          onLongPressEnd: onLongPressEnd,
          onLongPressMoveUpdate: onLongPressMoveUpdate,
          onForcePressStart: onForcePressStart,
          onForcePressEnd: onForcePressEnd,
          onForcePressPeak: onForcePressPeak,
          onForcePressUpdate: onForcePressUpdate,
          onPanStart: onPanStart,
          onPanUpdate: onPanUpdate,
          onPanDown: onPanDown,
          onSecondaryTapDown: onSecondaryTapDown,
          onSecondaryTapUp: onSecondaryTapUp,
        )));
  }

  void drawRect(
    Rect rect,
    Paint paint, {
    GestureTapDownCallback onTapDown,
    GestureTapUpCallback onTapUp,
    GestureLongPressStartCallback onLongPressStart,
    GestureLongPressEndCallback onLongPressEnd,
    GestureLongPressMoveUpdateCallback onLongPressMoveUpdate,
    GestureForcePressStartCallback onForcePressStart,
    GestureForcePressEndCallback onForcePressEnd,
    GestureForcePressPeakCallback onForcePressPeak,
    GestureForcePressUpdateCallback onForcePressUpdate,
    GestureDragStartCallback onPanStart,
    GestureDragUpdateCallback onPanUpdate,
    GestureDragDownCallback onPanDown,
    GestureTapDownCallback onSecondaryTapDown,
    GestureTapUpCallback onSecondaryTapUp,
  }) {
    _canvas.drawRect(rect, paint);
    _shapeHandler.addShape(Rectangle(rect,
        paint: paint,
        gestureMap: TouchCanvasUtil.getGestureCallbackMap(
          onTapDown: onTapDown,
          onTapUp: onTapUp,
          onLongPressStart: onLongPressStart,
          onLongPressEnd: onLongPressEnd,
          onLongPressMoveUpdate: onLongPressMoveUpdate,
          onForcePressStart: onForcePressStart,
          onForcePressEnd: onForcePressEnd,
          onForcePressPeak: onForcePressPeak,
          onForcePressUpdate: onForcePressUpdate,
          onPanStart: onPanStart,
          onPanUpdate: onPanUpdate,
          onPanDown: onPanDown,
          onSecondaryTapDown: onSecondaryTapDown,
          onSecondaryTapUp: onSecondaryTapUp,
        )));
  }

  void drawShadow(
      Path path, Color color, double elevation, bool transparentOccluder) {
    _canvas.drawShadow(path, color, elevation, transparentOccluder);
    _shapeHandler.addShape(PathShape(path));
  }

//
//  void drawVertices(Vertices vertices, BlendMode blendMode, Paint paint) {
//    _canvas.drawVertices(vertices, blendMode, paint);
  // TODO: implement drawVertices
//  }

//
//  void rotate(double radians) {
//    // TODO: implement rotate
//  }

//
//  void scale(double sx, [double sy]) {
//    // TODO: implement scale
//  }

//
//  void skew(double sx, double sy) {
//    // TODO: implement skew
//  }

//
//  void transform(Float64List matrix4) {
//    // TODO: implement transform
//  }

//
//  void translate(double dx, double dy) {
//   _canvas.translate(dx, dy);
//  }

//
//  void drawAtlas(Image atlas, List<RSTransform> transforms, List<Rect> rects,
//      List<Color> colors, BlendMode blendMode, Rect cullRect, Paint paint) {
//    _canvas.drawAtlas(atlas, transforms, rects, colors, blendMode, cullRect, paint);
//  }

  void drawImage(
    Image image,
    Offset p,
    Paint paint, {
    GestureTapDownCallback onTapDown,
    GestureTapUpCallback onTapUp,
    GestureLongPressStartCallback onLongPressStart,
    GestureLongPressEndCallback onLongPressEnd,
    GestureLongPressMoveUpdateCallback onLongPressMoveUpdate,
    GestureForcePressStartCallback onForcePressStart,
    GestureForcePressEndCallback onForcePressEnd,
    GestureForcePressPeakCallback onForcePressPeak,
    GestureForcePressUpdateCallback onForcePressUpdate,
    GestureDragStartCallback onPanStart,
    GestureDragUpdateCallback onPanUpdate,
    GestureDragDownCallback onPanDown,
    GestureTapDownCallback onSecondaryTapDown,
    GestureTapUpCallback onSecondaryTapUp,
  }) {
    _canvas.drawImage(image, p, paint);
    _shapeHandler.addShape(Rectangle(
        Rect.fromLTWH(
            p.dx, p.dy, image.width.toDouble(), image.height.toDouble()),
        paint: paint,
        gestureMap: TouchCanvasUtil.getGestureCallbackMap(
          onTapDown: onTapDown,
          onTapUp: onTapUp,
          onLongPressStart: onLongPressStart,
          onLongPressEnd: onLongPressEnd,
          onLongPressMoveUpdate: onLongPressMoveUpdate,
          onForcePressStart: onForcePressStart,
          onForcePressEnd: onForcePressEnd,
          onForcePressPeak: onForcePressPeak,
          onForcePressUpdate: onForcePressUpdate,
          onPanStart: onPanStart,
          onPanUpdate: onPanUpdate,
          onPanDown: onPanDown,
          onSecondaryTapDown: onSecondaryTapDown,
          onSecondaryTapUp: onSecondaryTapUp,
        )));
  }

  void drawArc(Rect rect, double startAngle, double sweepAngle, bool useCenter,
      Paint paint,
      {GestureTapDownCallback onTapDown}) {
    _canvas.drawArc(rect, startAngle, sweepAngle, useCenter, paint);
    var arc = Arc(rect, startAngle, sweepAngle, useCenter,
        paint: paint,
        gestureMap: TouchCanvasUtil.getGestureCallbackMap(
            onTapDown: onTapDown,
            onTapUp: null,
            onLongPressStart: null,
            onLongPressEnd: null,
            onLongPressMoveUpdate: null,
            onForcePressStart: null,
            onForcePressEnd: null,
            onForcePressPeak: null,
            onForcePressUpdate: null,
            onPanStart: null,
            onPanUpdate: null,
            onPanDown: null,
            onSecondaryTapDown: null,
            onSecondaryTapUp: null));
    _shapeHandler.addShape(arc);
  }

//
//  void drawDRRect(RRect outer, RRect inner, Paint paint) {
//    _canvas.drawDRRect(outer, inner, paint);
//    // TODO: implement drawDRRect in SHapeHandler
//  }

//
//
//  void drawRawAtlas(Image atlas, Float32List rstTransforms, Float32List rects,
//      Int32List colors, BlendMode blendMode, Rect cullRect, Paint paint) {
//    _canvas.drawRawAtlas(atlas, rstTransforms, rects, colors, blendMode, cullRect, paint);
//  }
//
//  void drawImageNine(Image image, Rect center, Rect dst, Paint paint){
//    _canvas.drawImageNine(image, center, dst, paint);
//  }
//
//  void drawImageRect(Image image, Rect src, Rect dst, Paint paint){
//    _canvas.drawImageRect(image, src, dst, paint);
//  }
}
