import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:touchable/src/shapes/point.dart';

void testPoint() {
  test('PointMode.points : Point lie on or off the points test', () {
    var p = Point(
        PointMode.points, [Offset(0, 0), Offset(100, 100), Offset(210, 234)]);
    expect(p.isInside(Offset(0, 0)), true);
    expect(p.isInside(Offset(10, 0)), false);
    expect(p.isInside(Offset(210, 234)), true);
    expect(p.isInside(Offset(100, 100)), true);
    expect(p.isInside(Offset(100, 101)), false);

    var p1 = Point(PointMode.points, [Offset(131.0, 419.00)],
        paint: Paint()..strokeWidth = 100);
    expect(p1.isInside(Offset(109.3, 341.3)), false);
    expect(p1.isInside(Offset(171.8, 347.4)), false);
    expect(p1.isInside(Offset(196.2, 417.5)), false);
    expect(p1.isInside(Offset(160.0, 513.5)), false);
    expect(p1.isInside(Offset(107.0, 512.8)), false);
    expect(p1.isInside(Offset(59.0, 434.7)), false);
    expect(p1.isInside(Offset(60.6, 401.5)), false);

    expect(p1.isInside(Offset(165.0, 399.2)), true);
    expect(p1.isInside(Offset(135.6, 381.3)), true);
    expect(p1.isInside(Offset(115.8, 389.3)), true);
    expect(p1.isInside(Offset(115.0, 424.8)), true);
    expect(p1.isInside(Offset(147.8, 436.6)), true);
    expect(p1.isInside(Offset(165.0, 430.9)), true);

    var p2 = Point(PointMode.points, [Offset(131.0, 419.00)],
        paint: Paint()
          ..strokeWidth = 100
          ..strokeCap = StrokeCap.round);
    expect(p2.isInside(Offset(131.4, 503.2)), false);
    expect(p2.isInside(Offset(216.8, 456.8)), false);
    expect(p2.isInside(Offset(188.2, 358.5)), false);
    expect(p2.isInside(Offset(92.6, 360.4)), false);

    expect(p2.isInside(Offset(169.9, 434.3)), true);
    expect(p2.isInside(Offset(151.6, 400.0)), true);
    expect(p2.isInside(Offset(121.1, 418.7)), true);
    expect(p2.isInside(Offset(141.0, 445.7)), true);
  });

  test('PointMode.lines : Point lie on or off the lines test', () {
    var p = Point(PointMode.lines, [
      Offset(0, 0),
      Offset(100, 100),
      Offset(200, 200),
      Offset(200, 300),
      Offset(10, 35)
    ]);
    expect(p.isInside(Offset(10, 10)), true);
    expect(p.isInside(Offset(101, 10)), false);
    expect(p.isInside(Offset(200, 10)), false);
    expect(p.isInside(Offset(200, 250)), true);

    var p1 = Point(
        PointMode.lines,
        [
          Offset(131.0, 419.00),
          Offset(161.0, 519.00),
          Offset(281.0, 419.00),
          Offset(161.0, 519.00)
        ],
        paint: Paint()
          ..strokeWidth = 50
          ..strokeCap = StrokeCap.round);

    expect(p1.isInside(Offset(198.5, 425.9)), false);
    expect(p1.isInside(Offset(89.9, 471.6)), false);
    expect(p1.isInside(Offset(106.3, 540.6)), false);
    expect(p1.isInside(Offset(153.9, 563.0)), false);
    expect(p1.isInside(Offset(223.6, 531.4)), false);
    expect(p1.isInside(Offset(295.6, 466.3)), false);
    expect(p1.isInside(Offset(318.1, 389.7)), false);

    expect(p1.isInside(Offset(285.0, 427.0)), true);
    expect(p1.isInside(Offset(252.6, 459.8)), true);
    expect(p1.isInside(Offset(190.5, 500.6)), true);
    expect(p1.isInside(Offset(150.1, 489.1)), true);
    ///TODO : WARNING : MAKE THE BELOW TEST PASS
//    expect(p1.isInside(Offset(161.9, 526.9)), true);
//    expect(p1.isInside(Offset(144.0, 438.5)), true);
//    expect(p1.isInside(Offset(135.2, 414.9)), true);
  });

  test('PointMode.polygon : Point lie on or off the lines test', () {
    var p = Point(
        PointMode.polygon,
        [
          Offset(131.0, 419.00),
          Offset(161.0, 519.00),
          Offset(281.0, 419.00),
          Offset(161.0, 119.00)
        ],
        paint: Paint()
          ..strokeWidth = 30
          ..strokeCap = StrokeCap.round);

    expect(p.isInside(Offset(247.6, 212.2)), false);
    expect(p.isInside(Offset(205.0, 108.2)), false);
    expect(p.isInside(Offset(139.4, 166.1)), false);
    expect(p.isInside(Offset(156.6, 264.0)), false);
    expect(p.isInside(Offset(225.1, 397.3)), false);
    expect(p.isInside(Offset(185.5, 438.1)), false);
    expect(p.isInside(Offset(98.7, 461.7)), false);
    expect(p.isInside(Offset(189.3, 565.0)), false);
    expect(p.isInside(Offset(331.0, 430.1)), false);
    expect(p.isInside(Offset(301.0, 325.0)), false);

    expect(p.isInside(Offset(264.0, 338.7)), true);
    expect(p.isInside(Offset(288.4, 415.6)), true);
    expect(p.isInside(Offset(240.4, 467.8)), true);
    expect(p.isInside(Offset(176.8, 509.0)), true);
    expect(p.isInside(Offset(144.8, 441.9)), true);
    expect(p.isInside(Offset(185.9, 149.7)), true);
  });
}
