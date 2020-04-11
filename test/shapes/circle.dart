// Created by nateshmbhat on 04,April,2020

import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:touchable/src/shapes/circle.dart';

testCircle() {
    test('Circle test to check if point lies inside' , (){
        var c = Circle(center: Offset(0, 0), radius: 10);
        expect(c.isInside(Offset(10, 0)), true); // Point exactly on the circle
        expect(c.isInside(Offset(5, 5)), true);
        expect(c.isInside(Offset(11, 0)), false );
    });

    test('Test point lies inside for a thick circle' , (){
      var c1 = Circle(center: Offset(0, 0), radius: 10 , paint: Paint()..strokeWidth=10);
      expect(c1.isInside(Offset(14, 0)), true);
      expect(c1.isInside(Offset(16, 0)), false);
      expect(c1.isInside(Offset(5, 10)), true);
    });

   test('Point should not lie inside for an Unfilled circle',(){
      var c2 = Circle(center: Offset(0, 0), radius: 10 , paint: Paint()..strokeWidth=10..style=PaintingStyle.stroke);
      expect(c2.isInside(Offset(14, 0)), true);
      expect(c2.isInside(Offset(16, 0)), false);
      expect(c2.isInside(Offset(3,3)), false );
    });
}
