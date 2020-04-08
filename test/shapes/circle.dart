// Created by nateshmbhat on 04,April,2020

import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:matter/src/shapes/circle.dart';

testCircle() {
    test('Circle test to check if point lies inside' , (){
        var c = Circle(center: Offset(0, 0), radius: 10);
        expect(c.isInside(Offset(10, 0)), true); // Point exactly on the circle
        expect(c.isInside(Offset(5, 5)), true);
        expect(c.isInside(Offset(11, 0)), false );
    });
}
