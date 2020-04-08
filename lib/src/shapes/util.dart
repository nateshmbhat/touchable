// Created by nateshmbhat on 04,April,2020

import 'dart:math';
import 'dart:ui';

class ShapeUtil {
  static double distance(Offset p1 , Offset p2){
   return sqrt(pow(p2.dy-p1.dy  , 2)  + pow(p2.dx-p1.dx , 2)) ;
  }
}

class TouchCanvasUtil{

}
