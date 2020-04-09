// Created by nateshmbhat on 06,April,2020

import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:touchable/src/shapes/line.dart';
import 'package:touchable/src/shapes/rectangle.dart';

testRectangle(){
  test('Test points lie on and off the rectangle' , (){
    expect(Rectangle(Rect.fromLTWH(0, 0, 100, 200)).isInside(Offset(80,205)) , false) ;
    expect(Rectangle(Rect.fromLTWH(0, 0, 100, 200)).isInside(Offset(99,199)) , true) ;
    expect(Rectangle(Rect.fromLTWH(0, 0, 100, 200)).isInside(Offset(0,0)) , true) ;
  });
}



 