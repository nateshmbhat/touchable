import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:touchable/src/shape_handler.dart';
import 'package:touchable/src/shapes/arc.dart';
import 'package:touchable/src/shapes/circle.dart';
import 'package:touchable/src/shapes/line.dart';
import 'package:touchable/src/shapes/oval.dart';
import 'package:touchable/src/shapes/point.dart';
import 'package:touchable/src/shapes/rectangle.dart';
import 'package:touchable/src/shapes/rounded_rectangle.dart';
import 'package:touchable/src/shapes/util.dart';
import 'package:touchable/touchable.dart';

void testTranslucent() {
  group('SHape Handler : Translucent hittest', () {
    var shapeHandler = ShapeHandler();
    var resultList = [];

    Map<GestureType, Function> getMap(Function function) {
      return TouchCanvasUtil.getGestureCallbackMap(
          onTapDown: (detail) {
            function(detail);
          },
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
          onSecondaryTapUp: null);
    }

    void addAllShapes() {
      shapeHandler.addShape(Circle(
          center: Offset(0, 0),
          radius: 60,
          paint: Paint()..color = Colors.deepOrange,
          gestureMap: getMap(() {})));

      shapeHandler.addShape(
        Line(Offset(0, 0), Offset(300, 700),
            paint: Paint()
              ..color = Colors.black
              ..strokeWidth = 200
              ..style = PaintingStyle.stroke, gestureMap: getMap((detail) {
          print('line touched');
          resultList.add('black');
        })),
      );

      shapeHandler.addShape(Oval(Rect.fromLTWH(100, 100, 300, 400),
          paint: Paint()
            ..color = Colors.deepPurple
            ..style = PaintingStyle.stroke
            ..strokeWidth = 70, gestureMap: getMap((_) {
        print('purple oval');
        resultList.add('purple');
      })));

      shapeHandler.addShape(Rectangle(Rect.fromLTWH(20, 300, 100, 300),
          paint: Paint()
            ..color = Colors.deepOrange
            ..style = PaintingStyle.stroke
            ..strokeWidth = 50, gestureMap: getMap((_) {
        print('orange circle');
        resultList.add('orange');
      })));

      var paint = Paint()
        ..color = Colors.greenAccent
        ..style = PaintingStyle.stroke
        ..strokeWidth = 10;
      shapeHandler.addShape(Circle(
        center: Offset(150, 50),
        radius: 60,
        paint: paint,
        gestureMap: getMap((_) {
          print('green circle');
          resultList.add('green');
        }),
      ));

      shapeHandler.addShape(Circle(
          center: Offset(150, 250),
          radius: 70,
          paint: Paint()..color = Colors.lightBlueAccent,
          hitTestBehavior: HitTestBehavior.translucent,
          gestureMap: getMap((_) {
            print('blue circle');
            resultList.add('blue');
          })));
      ;

//    canvas.drawVertices(vertices, blendMode, paint)
      shapeHandler.addShape(
        Arc(Rect.fromLTWH(100, 100, 200, 200), -pi, -3 * pi / 2, true,
            paint: Paint()
              ..strokeWidth = 40
              ..style = PaintingStyle.stroke
              ..color = Colors.pink, gestureMap: getMap((_) {
          print('pink arc');
          resultList.add('pink');
        })),
      );

      shapeHandler.addShape(RoundedRectangle(
          RRect.fromLTRBR(100, 340, 300, 650, Radius.elliptical(100, 150)),
          paint: Paint()
            ..strokeWidth = 40
            ..color = Colors.grey,
          hitTestBehavior: HitTestBehavior.translucent, gestureMap: getMap((_) {
        print('rounded grey rect');
        resultList.add('grey');
      })));

      shapeHandler.addShape(Point(PointMode.points, [Offset(129.1, 241.9)],
          paint: Paint()
            ..color = Colors.black
            ..strokeWidth = 10));
    }

    addAllShapes();
    void handleGesture(Offset position, List<String> expected) {
      resultList = [];
      shapeHandler.handleGestureEvent(Gesture(
          GestureType.onTapDown, TapDownDetails(localPosition: position)));
      expect(resultList, expected);
    }

    test(
        'Clicking a certain TRANSLUCENT shape calls the callback functions of this shape and others below it',
        () {
      handleGesture(Offset(212.2, 171.4), ['pink']);
      handleGesture(Offset(88.0, 356.2), ['purple']);
      handleGesture(Offset(166.1, 242.7), ['blue', 'black']);
      handleGesture(Offset(249.9, 332.2), ['black']);
      handleGesture(Offset(134.1, 59.8), ['black']);
      handleGesture(Offset(87.2, 349.7), ['purple']);
      handleGesture(Offset(236.6, 426.7), ['grey', 'black']);
      handleGesture(Offset(214.9, 483.4), ['grey', 'purple']);
      handleGesture(Offset(213.0, 58.7), ['green']);
      handleGesture(Offset(270, 10), []);
    });
  });
}
