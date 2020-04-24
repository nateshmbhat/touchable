import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:touchable/src/shapes/rectangle.dart';

void testRectangle() {
  test('Filled Rectangle test : Point lies inside ', () {
    var rect = Rectangle(Rect.fromLTWH(0, 0, 100, 200));
    expect(rect.isInside(Offset(80, 205)), false);
    expect(rect.isInside(Offset(99, 199)), true);
    expect(rect.isInside(Offset(0, 0)), true);
  });

  test('Stroked Rectangle test : Point lies inside ', () {
    var rect = Rectangle(Rect.fromLTWH(0, 0, 100, 200),
        paint: Paint()..style = PaintingStyle.stroke);
    expect(rect.isInside(Offset(80, 205)), false);
    expect(rect.isInside(Offset(99, 199)), false);
    expect(rect.isInside(Offset(0, 0)), true);
  });

  test('Stroked Rectangle test : Point lies inside ', () {
    var rect = Rectangle(
        Rect.fromLTWH(
          0,
          0,
          100,
          200,
        ),
        paint: Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 5);
    expect(rect.isInside(Offset(80, 205)), false);
    expect(rect.isInside(Offset(94, 197)), false);
    expect(rect.isInside(Offset(94, 198.5)), true);
    expect(rect.isInside(Offset(94, 194)), false);
    expect(rect.isInside(Offset(95, 199)), true);
    expect(rect.isInside(Offset(0, 0)), true);

    var rect1 = Rectangle(Rect.fromLTWH(20, 300, 100, 300),
        paint: Paint()
          ..color = Colors.deepOrange
          ..style = PaintingStyle.stroke
          ..strokeWidth = 50);

    expect(rect1.isInside(Offset(123.4, 564.2)), true);
    expect(rect1.isInside(Offset(127.2, 473.5)), true);
    expect(rect1.isInside(Offset(135.2, 357.7)), true);
    expect(rect1.isInside(Offset(27.8, 358.9)), true);
    expect(rect1.isInside(Offset(26.7, 572.2)), true);
  });

  test(
      'PaintStyleForTouch override test for Paint :  Stroked Rectangle with filled touch : Point lies inside ',
      () {
    var rect = Rectangle(
        Rect.fromLTWH(
          0,
          0,
          100,
          200,
        ),
        paint: Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 5);
    expect(rect.isInside(Offset(80, 205)), false);
    expect(rect.isInside(Offset(94, 197)), false);
    expect(rect.isInside(Offset(94, 198.5)), true);
    expect(rect.isInside(Offset(94, 194)), false);
    expect(rect.isInside(Offset(95, 199)), true);
    expect(rect.isInside(Offset(0, 0)), true);

    var rect1 = Rectangle(Rect.fromLTWH(20, 300, 100, 300),
        paint: Paint()
          ..color = Colors.deepOrange
          ..style = PaintingStyle.stroke
          ..strokeWidth = 50);

    expect(rect1.isInside(Offset(123.4, 564.2)), true);
    expect(rect1.isInside(Offset(127.2, 473.5)), true);
    expect(rect1.isInside(Offset(135.2, 357.7)), true);
    expect(rect1.isInside(Offset(27.8, 358.9)), true);
    expect(rect1.isInside(Offset(26.7, 572.2)), true);
  });
}
