// Created by nateshmbhat on 05,April,2020
library matter;
import 'dart:async';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/material.dart' as material;
import 'package:touchable/src/shape_handler.dart';
import 'package:touchable/src/shapes/circle.dart';
import 'package:touchable/src/shapes/line.dart';
import 'package:touchable/src/shapes/oval.dart';
import 'package:touchable/src/shapes/path.dart';
import 'package:touchable/src/shapes/rectangle.dart';
import 'package:touchable/src/shapes/shape.dart';
import 'package:touchable/src/shapes/util.dart';
import 'package:touchable/src/types/types.dart';


class TouchyCanvas {
  final Canvas _canvas ;
  final StreamController<Gesture> controller;
  final ShapeHandler _shapeHandler = ShapeHandler() ;

  TouchyCanvas(this._canvas , this.controller){
    if(!controller.hasListener){
      controller.stream.listen((event) {
        _shapeHandler.handleGestureEvent(event) ;
      });
    }
  }




  @override
  void clipPath(Path path, {bool doAntiAlias = true ,  onTap }) {
    // TODO: implement clipPath
  }

  @override
  void clipRRect(RRect rrect, {bool doAntiAlias = true}) {
    // TODO: implement clipRRect
  }

  @override
  void clipRect(Rect rect, {ClipOp clipOp = ClipOp.intersect, bool doAntiAlias = true}) {
    // TODO: implement clipRect
  }

  @override
  void drawArc(Rect rect, double startAngle, double sweepAngle, bool useCenter, Paint paint) {
    // TODO: implement drawArc
  }

  @override
  void drawCircle(Offset c, double radius, Paint paint , {material.GestureTapDownCallback onTapDown}) {
    _canvas.drawCircle(c, radius, paint);
    _shapeHandler.addShape(Circle(center: c , radius: radius , onTapDown: onTapDown,paint: paint));
  }

  @override
  void drawDRRect(RRect outer, RRect inner, Paint paint) {
    _canvas.drawDRRect(outer, inner, paint);
    // TODO: implement drawDRRect
  }

  @override
  void drawLine(Offset p1, Offset p2, Paint paint, {material.GestureTapDownCallback onTapDown}) {
    _canvas.drawLine(p1, p2, paint);
    _shapeHandler.addShape(Line(p1 , p2 , onTapDown: onTapDown, paint: paint ));
  }

  @override
  void drawOval(Rect rect, Paint paint,{material.GestureTapDownCallback onTapDown}) {
    _canvas.drawOval(rect, paint);
    _shapeHandler.addShape(Oval(rect,paint:paint,onTapDown:onTapDown));
  }

  @override
  void drawParagraph(Paragraph paragraph, Offset offset,{material.GestureTapDownCallback onTapDown}) {
    throw UnimplementedError("draw Paragraph not implemented yet");
  }

  @override
  void drawPath(Path path, Paint paint,{material.GestureTapDownCallback onTapDown}) {
    _canvas.drawPath(path, paint);
    _shapeHandler.addShape(PathShape(path,paint: paint,onTapDown: onTapDown));
  }

  @override
  void drawPoints(PointMode pointMode, List<Offset> points, Paint paint) {
    // TODO: implement drawPoints
  }

  @override
  void drawRRect(RRect rrect, Paint paint) {
    // TODO: implement drawRRect
  }


  @override
  void drawRawPoints(PointMode pointMode, Float32List points, Paint paint) {
    // TODO: implement drawRawPoints
  }

  @override
  void drawRect(Rect rect, Paint paint , {material.GestureTapDownCallback onTapDown}) {
    _canvas.drawRect(rect, paint);
    _shapeHandler.addShape(Rectangle(rect,onTapDown: onTapDown,paint: paint));
  }

  @override
  void drawShadow(Path path, Color color, double elevation, bool transparentOccluder) {
    // TODO: implement drawShadow
  }

  @override
  void drawVertices(Vertices vertices, BlendMode blendMode, Paint paint) {
    // TODO: implement drawVertices
  }

  @override
  void rotate(double radians) {
    // TODO: implement rotate
  }

  @override
  void scale(double sx, [double sy]) {
    // TODO: implement scale
  }

  @override
  void skew(double sx, double sy) {
    // TODO: implement skew
  }

  @override
  void transform(Float64List matrix4) {
    // TODO: implement transform
  }

  @override
  void translate(double dx, double dy) {
    // TODO: implement translate
  }

  @override
  void drawAtlas(Image atlas, List<RSTransform> transforms, List<Rect> rects, List<Color> colors, BlendMode blendMode, Rect cullRect, Paint paint) {
    // TODO: implement drawAtlas
  }

  @override
  void drawImage(Image image, Offset p, Paint paint) {
    // TODO: implement drawImage
  }

  @override
  void drawImageNine(Image image, Rect center, Rect dst, Paint paint) {
    // TODO: implement drawImageNine
  }

  @override
  void drawImageRect(Image image, Rect src, Rect dst, Paint paint) {
    // TODO: implement drawImageRect
  }

  @override
  void drawRawAtlas(Image atlas, Float32List rstTransforms, Float32List rects, Int32List colors, BlendMode blendMode, Rect cullRect, Paint paint) {
    // TODO: implement drawRawAtlas
  }
}
