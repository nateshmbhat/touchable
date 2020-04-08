import 'dart:async';
import 'package:flutter/material.dart';

/// Created by nateshmbhat on 04,April,2020

typedef CustomTouchPaintBuilder = CustomPaint Function(
    BuildContext context, StreamController<Gesture> touchController);

class CanvasTouchDetector extends StatefulWidget {
  final CustomTouchPaintBuilder builder;

  const CanvasTouchDetector({Key key, this.builder}) : super(key: key);

  @override
  _CanvasTouchDetectorState createState() => _CanvasTouchDetectorState();
}

class Gesture {
  final dynamic gestureDetail;

  final Type gestureCallback;

  Gesture(this.gestureCallback, this.gestureDetail);
}

class _CanvasTouchDetectorState extends State<CanvasTouchDetector> {
  final StreamController<Gesture> touchController = StreamController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTapDown: (tapDetail) {
          touchController.add(Gesture(GestureTapDownCallback, tapDetail));
        },
        onTapUp: (tapDetail) {
          touchController.add(Gesture(GestureTapUpCallback, tapDetail));
        },
        onHorizontalDragDown: (tapDetail) {
          touchController.add(Gesture(GestureDragDownCallback, tapDetail));
        },
        onHorizontalDragStart: (tapDetail) {
          touchController.add(Gesture(GestureDragStartCallback, tapDetail));
        },
        onHorizontalDragUpdate: (tapDetail) {
          touchController.add(Gesture(GestureDragUpdateCallback, tapDetail));
        },
        onVerticalDragDown: (tapDetail) {
          touchController.add(Gesture(GestureDragDownCallback, tapDetail));
        },
        onVerticalDragStart: (tapDetail) {
          touchController.add(Gesture(GestureDragStartCallback, tapDetail));
        },
        onVerticalDragUpdate: (tapDetail) {
          touchController.add(Gesture(GestureDragUpdateCallback, tapDetail));
        },
        onLongPressStart: (tapDetail) {
          touchController
              .add(Gesture(GestureLongPressStartCallback, tapDetail));
        },
        onLongPressEnd: (tapDetail) {
          touchController.add(Gesture(GestureLongPressEndCallback, tapDetail));
        },
        onLongPressMoveUpdate: (tapDetail) {
          touchController
              .add(Gesture(GestureLongPressMoveUpdateCallback, tapDetail));
        },
        onScaleStart: (tapDetail) {
          touchController.add(Gesture(GestureScaleStartCallback, tapDetail));
        },
        onScaleUpdate: (tapDetail) {
          touchController.add(Gesture(GestureScaleUpdateCallback, tapDetail));
        },
        onForcePressStart: (tapDetail) {
          touchController
              .add(Gesture(GestureForcePressStartCallback, tapDetail));
        },
        onForcePressEnd: (tapDetail) {
          touchController.add(Gesture(GestureForcePressEndCallback, tapDetail));
        },
        onForcePressPeak: (tapDetail) {
          touchController
              .add(Gesture(GestureForcePressPeakCallback, tapDetail));
        },
        onForcePressUpdate: (tapDetail) {
          touchController
              .add(Gesture(GestureForcePressUpdateCallback, tapDetail));
        },
        onPanStart: (tapDetail) {
          touchController.add(Gesture(GestureDragStartCallback, tapDetail));
        },
        onPanEnd: (tapDetail) {
          touchController.add(Gesture(GestureDragEndCallback, tapDetail));
        },
        onPanUpdate: (tapDetail) {
          touchController.add(Gesture(GestureDragUpdateCallback, tapDetail));
        },
        onPanDown: (tapDetail) {
          touchController.add(Gesture(GestureDragDownCallback, tapDetail));
        },
        onSecondaryTapDown: (tapDetail) {
          touchController.add(Gesture(GestureTapDownCallback, tapDetail));
        },
        onSecondaryTapUp: (tapDetail) {
          touchController.add(Gesture(GestureTapUpCallback, tapDetail));
        },
        child: widget.builder(context, touchController));
  }

  @override
  void dispose() {
    touchController.close();
    super.dispose();
  }
}
