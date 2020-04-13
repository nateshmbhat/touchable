// Created by nateshmbhat on 12,April,2020

import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:touchable/src/shapes/point.dart';

testPoint(){
  test('PointMode.points : Point lie on or off the points test',(){
    var p = Point(PointMode.points,[Offset(0,0),Offset(100,100),Offset(210,234)])  ;
    expect(p.isInside(Offset(0,0)),true) ;
    expect(p.isInside(Offset(10,0)),false) ;
    expect(p.isInside(Offset(210,234)),true) ;
    expect(p.isInside(Offset(100,100)),true) ;
    expect(p.isInside(Offset(100,101)),false) ;
  });

  test('PointMode.lines : Point lie on or off the lines test',(){
    var p = Point(PointMode.lines ,[Offset(0,0),Offset(100,100),Offset(200,200),Offset(200,300),Offset(10,35)])  ;
    expect(p.isInside(Offset(10,10)),true) ;
    expect(p.isInside(Offset(101,10)),false) ;
    expect(p.isInside(Offset(200,10)),false) ;
    expect(p.isInside(Offset(200,250)),true) ;
  });

  test('PointMode.polygon : Point lie on or off the lines test',(){
    var p = Point(PointMode.polygon , [Offset(0,0),Offset(100,100),Offset(200,200),Offset(150,300),Offset(10,35)])  ;
    expect(p.isInside(Offset(10,10)),true) ;
    expect(p.isInside(Offset(101,10)),false) ;
    expect(p.isInside(Offset(200,10)),false) ;
    expect(p.isInside(Offset(200,250)),false) ;

    expect(p.isInside(Offset(10,20)),true) ;
    expect(p.isInside(Offset(100,300)),false) ;
    expect(p.isInside(Offset(150,275)),true) ;
    expect(p.isInside(Offset(300,300)),false) ;
    expect(p.isInside(Offset(150,250)),true) ;
  });
}