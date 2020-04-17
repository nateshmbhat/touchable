// Created by nateshmbhat on 16,April,2020
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:touchable/src/shapes/arc.dart';

void testArc() {
  test('Arc test to check if point lies inside filled segment', () {
    var arc = Arc(Rect.fromLTWH(100, 100, 200, 200), pi, pi / 2, false,
        paint: Paint()
          ..strokeWidth = 1
          ..style = PaintingStyle.fill
          ..color = Colors.pink);
    expect(arc.isInside(Offset(180, 245)), false);
    expect(arc.isInside(Offset(261.0, 142.9)), false);
    expect(arc.isInside(Offset(204.2, 72.0)), false);
    expect(arc.isInside(Offset(77.0, 166.1)), false);
    expect(arc.isInside(Offset(247.2, 269.7)), false);
    expect(arc.isInside(Offset(117.3, 165.3)), true);
    expect(arc.isInside(Offset(168.8, 121.1)), true);

    var arc1 = Arc(Rect.fromLTWH(100, 100, 200, 200), pi, 3 * pi / 2, false,
        paint: Paint()
          ..strokeWidth = 1
          ..style = PaintingStyle.fill
          ..color = Colors.pink);
    expect(arc1.isInside(Offset(225.5, 179.4)), true);
    expect(arc1.isInside(Offset(220.6, 280.4)), true);
    expect(arc1.isInside(Offset(196.6, 131.8)), true);
    expect(arc1.isInside(Offset(80.8, 140.6)), false);
    expect(arc1.isInside(Offset(329.1, 201.9)), false);
    expect(arc1.isInside(Offset(118.9, 291.8)), false);

    var arc2 = Arc(Rect.fromLTWH(100, 100, 200, 200), 3 * pi / 2, pi / 3, false,
        paint: Paint()
          ..color = Colors.pink);

    expect(arc2.isInside(Offset(163.4, 153.1)), false);
    expect(arc1.isInside(Offset(229.3, 214.5)), false);
    expect(arc2.isInside(Offset(272.4, 185.1)), false);
    expect(arc2.isInside(Offset(307.0, 115.4)), false);
    expect(arc2.isInside(Offset(237.0, 67.8)), false);

    expect(arc2.isInside(Offset(247.6, 122.3)), true);
    expect(arc2.isInside(Offset(227.0, 113.1)), true);
  });

  test('Arc test : check point lies inside filled sector', () {
    var arc = Arc(Rect.fromLTWH(100, 100, 200, 200), pi, pi / 2, true,
        paint: Paint()
          ..strokeWidth = 1
          ..style = PaintingStyle.fill
          ..color = Colors.pink);
    expect(arc.isInside(Offset(129.1, 241.9)), false);
    expect(arc.isInside(Offset(203.8, 244.6)), false);
    expect(arc.isInside(Offset(239.2, 206.9)), false);
    expect(arc.isInside(Offset(226.3, 126.1)), false);
    expect(arc.isInside(Offset(169.1, 73.9)), false);
    expect(arc.isInside(Offset(105.9, 119.6)), false);
    expect(arc.isInside(Offset(86.5, 188.2)), false);

    expect(arc.isInside(Offset(131.8, 183.2)), true);
    expect(arc.isInside(Offset(169.5, 176.8)), true);
    expect(arc.isInside(Offset(179.0, 133.3)), true);

    var arc1 = Arc(Rect.fromLTWH(100, 100, 200, 200), pi, 3 * pi / 2, true,
        paint: Paint()
          ..strokeWidth = 1
          ..style = PaintingStyle.fill
          ..color = Colors.pink);
    expect(arc1.isInside(Offset(238.1, 275.0)), true);
    expect(arc1.isInside(Offset(234.7, 189.3)), true);
    expect(arc1.isInside(Offset(232.4, 233.9)), true);
    expect(arc1.isInside(Offset(282.7, 189.3)), true);
    expect(arc1.isInside(Offset(223.2, 142.5)), true);
    expect(arc1.isInside(Offset(134.9, 175.2)), true);

    expect(arc1.isInside(Offset(65.9, 181.7)), false);
    expect(arc1.isInside(Offset(102.9, 121.9)), false);
    expect(arc1.isInside(Offset(187.8, 91.0)), false);
    expect(arc1.isInside(Offset(234.3, 63.2)), false);
    expect(arc1.isInside(Offset(191.6, 86.9)), false);
    expect(arc1.isInside(Offset(338.7, 205.0)), false);
    expect(arc1.isInside(Offset(153.5, 324.6)), false);
  });

  test('Arc test : check point lies in stroked arc', () {
    var arc = Arc(Rect.fromLTWH(100, 100, 200, 200), pi, 3 * pi / 2, false,
        paint: Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 50
          ..color = Colors.pink);
    expect(arc.isInside(Offset(342.9, 286.9)), false);
    expect(arc.isInside(Offset(260.6, 211.4)), false);
    expect(arc.isInside(Offset(197.7, 159.6)), false);
    expect(arc.isInside(Offset(199.2, 230.1)), false);
    expect(arc.isInside(Offset(130.7, 259.8)), false);
    expect(arc.isInside(Offset(148.6, 53.3)), false);

    expect(arc.isInside(Offset(121.9, 166.1)), true);
    expect(arc.isInside(Offset(189.7, 101.0)), true);
    expect(arc.isInside(Offset(309.3, 200.4)), true);
    expect(arc.isInside(Offset(241.9, 292.2)), true);
    expect(arc.isInside(Offset(125.3, 181.0)), true);

    var arc2 = Arc(Rect.fromLTWH(100, 100, 200, 200), 3 * pi / 2, pi / 5, false,
        paint: Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 50
          ..color = Colors.pink);

    expect(arc2.isInside(Offset(229.7, 173.3)), false);
    expect(arc2.isInside(Offset(303.6, 158.9)), false);
    expect(arc2.isInside(Offset(299.4, 66.30)), false);
    expect(arc2.isInside(Offset(220.2, 34.3)), false);
    expect(arc2.isInside(Offset(178.7, 97.5)), false);

    expect(arc2.isInside(Offset(269.0, 102.9)), true);
    expect(arc2.isInside(Offset(222.1, 83.4)), true);
    expect(arc2.isInside(Offset(230.9, 115.0)), true);
  });

  test('Arc test : check point lies in stroked sector', () {
    var arc = Arc(Rect.fromLTWH(100, 100, 200, 200), pi, pi / 2, true,
        paint: Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 50
          ..color = Colors.pink);
    expect(arc.isInside(Offset(217.1, 192.0)), true);
    expect(arc.isInside(Offset(212.2, 110.1)), true);
    expect(arc.isInside(Offset(143.2, 132.2)), true);
    expect(arc.isInside(Offset(121.1, 201.1)), true);
    expect(arc.isInside(Offset(165.0, 204.6)), true);

    expect(arc.isInside(Offset(129.1, 241.9)), false);
    expect(arc.isInside(Offset(203.8, 244.6)), false);
    expect(arc.isInside(Offset(239.2, 206.9)), false);
    expect(arc.isInside(Offset(166.9, 156.6)), false);

    var arc1 = Arc(Rect.fromLTWH(100, 100, 200, 200), pi, 3 * pi / 2, true,
        paint: Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 50
          ..color = Colors.pink);
    expect(arc1.isInside(Offset(342.9, 286.9)), false);
    expect(arc1.isInside(Offset(260.6, 211.4)), false);
    expect(arc1.isInside(Offset(203.0, 148.6)), false);
    expect(arc1.isInside(Offset(260.6, 48.4)), false);
    expect(arc1.isInside(Offset(39.6, 176.0)), false);
    expect(arc1.isInside(Offset(151.2, 261.0)), false);
  });
}
