// Created by nateshmbhat on 04,April,2020

import 'package:flutter_test/flutter_test.dart';
import 'package:matter/src/shapes/line.dart';

testLine(){
  test('Test points lie on and off the line' , (){
    expect(Line(Offset(0,0) , Offset(10,0)).isInside(Offset(5,0)) , true) ;
    expect(Line(Offset(0,0) , Offset(10,0)).isInside(Offset(10.1,0)) , false) ;
    expect(Line(Offset(0,10) , Offset(0,0)).isInside(Offset(0,5)) , true) ;
    expect(Line(Offset(0,10) , Offset(0,0)).isInside(Offset(0,11)) , false) ;
  });
}

 