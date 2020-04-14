// Created by nateshmbhat on 05,April,2020
library matter;
import 'dart:async';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/material.dart' as material;
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
    _canvas.clipPath(path,doAntiAlias: doAntiAlias);
    _shapeHandler.addShape(ClipPathShape(path));
  }

  @override
  void clipRRect(RRect rrect, {bool doAntiAlias = true}) {
    _canvas.clipRRect(rrect,doAntiAlias: doAntiAlias);
    _shapeHandler.addShape(ClipRRectShape(rrect));
  }

  @override
  void clipRect(Rect rect, {ClipOp clipOp = ClipOp.intersect, bool doAntiAlias = true}) {
    _canvas.clipRect(rect,clipOp: clipOp,doAntiAlias: doAntiAlias);
    _shapeHandler.addShape(ClipRectShape(rect,clipOp: clipOp));
  }

//  @override
//  void drawArc(Rect rect, double startAngle, double sweepAngle, bool useCenter, Paint paint) {
//    _canvas.drawArc(rect, startAngle, sweepAngle, useCenter, paint);
//    _shapeHandler.addShape(Arc(rect,startAngle,sweepAngle,useCenter,paint: paint));
//  }

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

//  @override
//  void drawParagraph(Paragraph paragraph, Offset offset,{material.GestureTapDownCallback onTapDown}) {
//    throw UnimplementedError("draw Paragraph not implemented yet");
//  }

  @override
  void drawPath(Path path, Paint paint,{material.GestureTapDownCallback onTapDown}) {
    _canvas.drawPath(path, paint);
    _shapeHandler.addShape(PathShape(path,paint: paint,onTapDown: onTapDown));
  }

  @override
  void drawPoints(PointMode pointMode, List<Offset> points, Paint paint,{material.GestureTapDownCallback onTapDown}) {
    _canvas.drawPoints(pointMode, points, paint);
    _shapeHandler.addShape(Point(pointMode,points,paint: paint,onTapDown: onTapDown));
  }

  @override
  void drawRRect(RRect rrect, Paint paint) {
    _canvas.drawRRect(rrect, paint);
    _shapeHandler.addShape(RoundedRectangle(rrect,paint: paint));
  }


  @override
  void drawRawPoints(PointMode pointMode, Float32List points, Paint paint) {
    _canvas.drawRawPoints(pointMode,points, paint);
    List<Offset> offsetPoints = [] ;
    for(int i =0 ;i < points.length ; i+=2){
      offsetPoints.add(Offset(points[i],points[i+1]));
    }
    _shapeHandler.addShape(Point(pointMode, offsetPoints ,paint: paint));
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
//    _canvas.transform
    // TODO: implement transform
  }

  @override
  void translate(double dx, double dy) {
    // TODO: implement translate
  }

  @override
  void drawAtlas(Image atlas, List<RSTransform> transforms, List<Rect> rects, List<Color> colors, BlendMode blendMode, Rect cullRect, Paint paint) {
    _canvas.drawAtlas(atlas, transforms, rects, colors, blendMode, cullRect, paint);
  }

  @override
  void drawImage(Image image, Offset p, Paint paint) {
    _canvas.drawImage(image, p, paint);
    _shapeHandler.addShape(Rectangle(Rect.fromLTWH(p.dx, p.dy, image.width.toDouble(), image.height.toDouble()),paint: paint));
  }

  @override
  void drawRawAtlas(Image atlas, Float32List rstTransforms, Float32List rects, Int32List colors, BlendMode blendMode, Rect cullRect, Paint paint) {
    // TODO: implement drawRawAtlas
  }
}
