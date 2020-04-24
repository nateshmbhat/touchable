import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:touchable/src/shapes/rounded_rectangle.dart';

void testRoundedRectangle() {
  test('Filled Rounded Rectangle test : Point lies inside ', () {
    var rect = RoundedRectangle(
        RRect.fromLTRBR(100, 340, 300, 650, Radius.circular(100)));
    expect(rect.isInside(Offset(106.7, 347.0)), false);
    expect(rect.isInside(Offset(63.2, 453.3)), false);
    expect(rect.isInside(Offset(109.0, 651.0)), false);
    expect(rect.isInside(Offset(276.2, 667.8)), false);
    expect(rect.isInside(Offset(311.2, 500.6)), false);
    expect(rect.isInside(Offset(282.7, 344.8)), false);
    expect(rect.isInside(Offset(323.4, 489.5)), false);

    expect(rect.isInside(Offset(131.0, 419.0)), true);
    expect(rect.isInside(Offset(250.3, 413.0)), true);
    expect(rect.isInside(Offset(131.8, 604.2)), true);
    expect(rect.isInside(Offset(238.1, 608.4)), true);
  });

  test('Stroked Rounded Rectangle test : Point lies inside ', () {
    var rect = RoundedRectangle(
        RRect.fromLTRBR(100, 340, 300, 650, Radius.circular(100)),
        paint: Paint()
          ..strokeWidth = 40
          ..style = PaintingStyle.stroke);

    expect(rect.isInside(Offset(66.3, 354.7)), false);
    expect(rect.isInside(Offset(43.0, 497.1)), false);
    expect(rect.isInside(Offset(73.5, 657.1)), false);
    expect(rect.isInside(Offset(288.8, 670.1)), false);
    expect(rect.isInside(Offset(338.7, 536.8)), false);
    expect(rect.isInside(Offset(341.7, 462.9)), false);
    expect(rect.isInside(Offset(306.7, 347.4)), false);
    expect(rect.isInside(Offset(206.5, 575.6)), false);
    expect(rect.isInside(Offset(139.4, 509.3)), false);

    expect(rect.isInside(Offset(198.9, 353.5)), true);
    expect(rect.isInside(Offset(285.0, 485.7)), true);
    expect(rect.isInside(Offset(243.4, 642.7)), true);
    expect(rect.isInside(Offset(132.6, 642.3)), true);
    expect(rect.isInside(Offset(97.9, 497.5)), true);
  });
}
