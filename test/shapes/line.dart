import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:touchable/src/shapes/line.dart';

void testLine() {
  test('Test points lie on and off the line', () {
    expect(Line(Offset(0, 0), Offset(10, 0)).isInside(Offset(5, 0)), true);
    expect(
        Line(Offset(0, 0), Offset(10, 0)).isInside(Offset(10.1, 0.1)), false);
    expect(
        Line(Offset(0, 10), Offset(10, 10)).isInside(Offset(10.1, 0.1)), false);
    expect(Line(Offset(0, 10), Offset(10, 10)).isInside(Offset(8, 9.9)), false);
    expect(Line(Offset(0, 0), Offset(10, 0)).isInside(Offset(10.1, 0)), false);
    expect(Line(Offset(0, 10), Offset(0, 0)).isInside(Offset(0, 5)), true);
    expect(Line(Offset(0, 10), Offset(0, 0)).isInside(Offset(0, 11)), false);
  });

  test('Point lies on Thick line', () {
    var paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 6;
    expect(
        Line(Offset(0, 0), Offset(200, 0), paint: paint).isInside(Offset(5, 0)),
        true);
    expect(
        Line(Offset(0, 0), Offset(200, 0), paint: paint)
            .isInside(Offset(201, 0)),
        false);
    expect(
        Line(Offset(0, 0), Offset(200, 0), paint: paint)
            .isInside(Offset(203, 0)),
        false);
    expect(
        Line(Offset(0, 0), Offset(200, 0), paint: paint)
            .isInside(Offset(204, 0)),
        false);
    expect(
        Line(Offset(0, 0), Offset(200, 0), paint: paint)
            .isInside(Offset(200, 1)),
        true);
    expect(
        Line(Offset(0, 0), Offset(200, 0), paint: paint)
            .isInside(Offset(100, 2)),
        true);
    expect(
        Line(Offset(0, 10), Offset(200, 10), paint: paint)
            .isInside(Offset(150, 4)),
        false);
    expect(
        Line(Offset(0, 10), Offset(200, 10), paint: paint)
            .isInside(Offset(150, 10 + 2.75)),
        true);
    expect(
        Line(Offset(0, 10), Offset(200, 10), paint: paint)
            .isInside(Offset(150, 10 + 3.0)),
        true);
    expect(
        Line(Offset(0, 10), Offset(200, 10), paint: paint)
            .isInside(Offset(150, 10 + 2.99)),
        true);
    expect(
        Line(Offset(0, 10), Offset(200, 10), paint: paint)
            .isInside(Offset(150, 10 + 3.1)),
        false);
    expect(
        Line(Offset(0, 10), Offset(200, 10), paint: paint)
            .isInside(Offset(150, 10 + 6.0)),
        false);

    expect(
        Line(Offset(0, 10), Offset(200, 10), paint: paint)
            .isInside(Offset(150, 10 - 2.0)),
        true);
    expect(
        Line(Offset(0, 10), Offset(200, 10), paint: paint)
            .isInside(Offset(150, 10 - 1.6)),
        true);
    expect(
        Line(Offset(0, 10), Offset(200, 10), paint: paint)
            .isInside(Offset(150, 10 - 3.1)),
        false);
    expect(
        Line(Offset(0, 10), Offset(200, 10), paint: paint)
            .isInside(Offset(150, 10 - 6.0)),
        false);
  });
}
