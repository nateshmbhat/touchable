import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:touchable/src/shapes/circle.dart';

void testCircle() {
  test('Circle test to check if point lies inside filled circle', () {
    var c = Circle(center: Offset(0, 0), radius: 10);
    expect(c.isInside(Offset(10, 0)), true); // Point exactly on the circle
    expect(c.isInside(Offset(5, 5)), true);
    expect(c.isInside(Offset(11, 0)), false);

    expect(c.isInside(Offset(14, 0)), false);
    expect(c.isInside(Offset(16, 0)), false);
    expect(c.isInside(Offset(5, 10)), false);
  });

  test('Point should not lie inside for an Unfilled circle', () {
    var c2 = Circle(
        center: Offset(0, 0),
        radius: 10,
        paint: Paint()
          ..strokeWidth = 10
          ..style = PaintingStyle.stroke);
    expect(c2.isInside(Offset(14, 0)), true);
    expect(c2.isInside(Offset(16, 0)), false);
    expect(c2.isInside(Offset(3, 3)), false);
  });
}
