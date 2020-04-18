// Created by nateshmbhat on 12,April,2020

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:touchable/src/shapes/point.dart';

void testPoint() {
  test('PointMode.points : Point lie on or off the points test',(){
    var p = Point(PointMode.points,[Offset(0,0),Offset(100,100),Offset(210,234)])  ;
    expect(p.isInside(Offset(0,0)),true) ;
    expect(p.isInside(Offset(10,0)),false) ;
    expect(p.isInside(Offset(210,234)),true) ;
    expect(p.isInside(Offset(100,100)),true) ;
    expect(p.isInside(Offset(100,101)),false) ;

    var p1 = Point(PointMode.points, [Offset(131.0, 419.00)], paint: Paint()
      ..strokeWidth = 100);
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

    var p2 = Point(PointMode.points, [Offset(131.0, 419.00)], paint: Paint()
      ..strokeWidth = 100
      ..strokeCap = StrokeCap.round);
    expect(p1.isInside(Offset(131.4, 503.2)), false);
    expect(p1.isInside(Offset(216.8, 456.8)), false);
    expect(p1.isInside(Offset(188.2, 358.5)), false);
    expect(p1.isInside(Offset(92.6, 360.4)), false);

    expect(p1.isInside(Offset(169.9, 434.3)), true);
    expect(p1.isInside(Offset(151.6, 400.0)), true);
    expect(p1.isInside(Offset(121.1, 418.7)), true);
    expect(p1.isInside(Offset(141.0, 445.7)), true);
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