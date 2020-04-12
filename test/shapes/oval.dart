// Created by nateshmbhat on 12,April,2020

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:touchable/src/shapes/oval.dart';

testOval(){
  test('Filled Oval : point inside test' , (){
    var oval =  Oval(Rect.fromLTRB(100, 100, 300, 400)) ;
    expect(oval.isInside(Offset(102,102)) , false );
    expect(oval.isInside(Offset(150,250)) , true);
    expect(oval.isInside(Offset(250,102)) , false );
    expect(oval.isInside(Offset(200,150)) , true);
  });

  test('Filled Oval with stroke width : Point inside test' , (){
    var oval =  Oval(Rect.fromLTRB(100, 100, 300, 400),paint: Paint()..strokeWidth=6) ;
    expect(oval.isInside(Offset(200,102)) , true);
    expect(oval.isInside(Offset(250,102)) , false );
    expect(oval.isInside(Offset(200,102)) , true);
  });

  test('Stroked Oval : Point inside test' , (){
    var oval =  Oval(Rect.fromLTRB(100, 100, 300, 400),paint: Paint()..strokeWidth=6..style=PaintingStyle.stroke) ;
    expect(oval.isInside(Offset(100,102)) , false);
    expect(oval.isInside(Offset(250,102)) , false );
    expect(oval.isInside(Offset(200,102)) , true);
    expect(oval.isInside(Offset(150,250)) , false);
  });
}

 