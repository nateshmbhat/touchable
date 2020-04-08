import 'dart:async';
import 'package:flutter/material.dart';

/// Created by nateshmbhat on 04,April,2020

typedef CustomTouchPaintBuilder = CustomPaint Function(BuildContext context, StreamController<Gesture> touchController);

class CanvasTouchDetector extends StatefulWidget {
  final CustomTouchPaintBuilder builder;
  const CanvasTouchDetector({Key key, this.builder}) : super(key: key);

  @override
  _CanvasTouchDetectorState createState() => _CanvasTouchDetectorState();
}

class Gesture{
  final dynamic gestureObject ;
  Gesture(this.gestureObject);
}

class _CanvasTouchDetectorState extends State<CanvasTouchDetector> {
  final StreamController<Gesture> touchController = StreamController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTapDown: (tapDetail) {
          print("GLobal position ${tapDetail.globalPosition}");
          print("Local position ${tapDetail.localPosition}");
          touchController.add(Gesture(tapDetail));
        },
        child: widget.builder(context, touchController));
  }

  @override
  void dispose() {
    touchController.close();
    super.dispose();
  }
}
