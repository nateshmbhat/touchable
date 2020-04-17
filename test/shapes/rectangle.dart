// Created by nateshmbhat on 06,April,2020

import 'dart:ui';

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
    var rect = Rectangle(Rect.fromLTWH(0, 0, 100, 200), paint: Paint()
      ..style = PaintingStyle.stroke);
    expect(rect.isInside(Offset(80, 205)), false);
    expect(rect.isInside(Offset(99, 199)), false);
    expect(rect.isInside(Offset(0, 0)), true);
  });

  test('Stroked Rectangle test : Point lies inside ', () {
    var rect = Rectangle(Rect.fromLTWH(0, 0, 100, 200,), paint: Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5);
    expect(rect.isInside(Offset(80, 205)), false);
    expect(rect.isInside(Offset(94, 197)), false);
    expect(rect.isInside(Offset(94, 198.5)), true);
    expect(rect.isInside(Offset(94, 194)), false);
    expect(rect.isInside(Offset(95, 199)), true);
    expect(rect.isInside(Offset(0, 0)), true);
  });
}



 