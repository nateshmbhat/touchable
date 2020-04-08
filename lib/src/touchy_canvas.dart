// Created by nateshmbhat on 05,April,2020
library matter;
import 'dart:async';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/material.dart' as material;
import 'package:matter/src/canvas_touch_detector.dart';
import 'package:matter/src/shapes/circle.dart';
import 'package:matter/src/shapes/line.dart';
import 'package:matter/src/shapes/rectangle.dart';
import 'package:matter/src/shapes/shape.dart';


class TouchyCanvas {
  final Canvas _canvas ;
  final StreamController<Gesture> controller;
  final List<Shape>  _shapeStack = [] ;

  TouchyCanvas(this._canvas , this.controller){
    if(!controller.hasListener){
      controller.stream.listen((event) {
        print("inside touch listener") ;

        var gesture = event.gestureObject ;
        if(gesture.runtimeType == String  ){

        }
        var touchPoint = Offset(event.localPosition.dx , event.localPosition.dy) ;
        for(int i =_shapeStack.length-1 ; i>=0 ; i--){
          if(_shapeStack[i].isInside(touchPoint)){
            _shapeStack[i].onTapDown(event.gestureObject) ;
            return ;
          }
        }
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
    _shapeStack.add(Circle(center: c , radius: radius , onTapDown: onTapDown,paint: paint));
  }

  @override
  void drawDRRect(RRect outer, RRect inner, Paint paint) {
    // TODO: implement drawDRRect
  }

  @override
  void drawLine(Offset p1, Offset p2, Paint paint, {material.GestureTapDownCallback onTapDown}) {
    _canvas.drawLine(p1, p2, paint);
    _shapeStack.add(Line(p1 , p2 , onTapDown: onTapDown, paint: paint ));
  }

  @override
  void drawOval(Rect rect, Paint paint) {
    // TODO: implement drawOval
  }

  @override
  void drawParagraph(Paragraph paragraph, Offset offset) {
    // TODO: implement drawParagraph
  }

  @override
  void drawPath(Path path, Paint paint) {
    // TODO: implement drawPath
  }

  @override
  void drawPicture(Picture picture) {
    // TODO: implement drawPicture
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
    _shapeStack.add(Rectangle(rect,onTapDown: onTapDown,paint: paint));
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
