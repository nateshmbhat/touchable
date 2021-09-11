import 'dart:async';

import 'package:flutter/material.dart';
import 'package:touchable/src/types/types.dart';

///[CanvasTouchDetector] widget detects the gestures on your [CustomPaint] widget.
///
/// Wrap your [CustomPaint] widget with [CanvasTouchDetector]
/// The [builder] function passes the [BuildContext] and expects a [CustomPaint] object as its return value.
class CanvasTouchDetector extends StatefulWidget {
  final CustomTouchPaintBuilder builder;

  const CanvasTouchDetector({Key? key, required this.builder}) : super(key: key);

  @override
  _CanvasTouchDetectorState createState() => _CanvasTouchDetectorState();
}

class _CanvasTouchDetectorState extends State<CanvasTouchDetector> {
  final StreamController<Gesture> touchController = StreamController.broadcast();
  StreamSubscription? streamSubscription;

  Future<void> addStreamListener(Function(Gesture) callBack) async {
    await streamSubscription?.cancel();
    streamSubscription = touchController.stream.listen(callBack);
  }

  @override
  Widget build(BuildContext context) {
    return TouchDetectionController(touchController, addStreamListener,
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          child: Builder(
            builder: (context) {
              return widget.builder(context);
            },
          ),
          onTapDown: (tapDetail) {
            print('onTapDown');            
            touchController.add(Gesture(GestureType.onTapDown, tapDetail));
          },
          onTapUp: (tapDetail) {
            print('onTapUp');           
            touchController.add(Gesture(GestureType.onTapUp, tapDetail));
          },
//        onHorizontalDragDown: (tapDetail) {
//          touchController.add(Gesture( GestureType.onHorizontalDragDown, tapDetail));
//        },
//        onHorizontalDragStart: (tapDetail) {
//          touchController.add(Gesture( GestureType.onHorizontalDragStart, tapDetail));
//        },
//        onHorizontalDragUpdate: (tapDetail) {
//          touchController.add(Gesture( GestureType.onHorizontalDragUpdate, tapDetail));
//        },
//        onVerticalDragDown: (tapDetail) {
//          touchController.add(Gesture( GestureType.onVerticalDragDown, tapDetail));
//        },
//        onVerticalDragStart: (tapDetail) {
//          touchController.add(Gesture( GestureType.onVerticalDragStart, tapDetail));
//        },
//        onVerticalDragUpdate: (tapDetail) {
//          touchController.add(Gesture( GestureType.onVerticalDragUpdate, tapDetail));
//        },
          onLongPressStart: (tapDetail) {
            print('onLongPressStart');            
            touchController.add(Gesture(GestureType.onLongPressStart, tapDetail));
          },
          onLongPressEnd: (tapDetail) {
            print('onLongPressEnd');            
            touchController.add(Gesture(GestureType.onLongPressEnd, tapDetail));
          },
          onLongPressMoveUpdate: (tapDetail) {
            print('onLongPressMoveUpdate');            
            touchController.add(Gesture(GestureType.onLongPressMoveUpdate, tapDetail));
          },
//        onScaleStart: (tapDetail) {
//          touchController.add(Gesture( GestureType.onScaleStart, tapDetail));
//        },
//        onScaleUpdate: (tapDetail) {
//          touchController.add(Gesture( GestureType.onScaleUpdate, tapDetail));
//        },
          onForcePressStart: (tapDetail) {
            print('onForcePressStart');
            touchController.add(Gesture(GestureType.onForcePressStart, tapDetail));
          },
          onForcePressEnd: (tapDetail) {
            print('onForcePressEnd');
            touchController.add(Gesture(GestureType.onForcePressEnd, tapDetail));
          },
          onForcePressPeak: (tapDetail) {
            touchController.add(Gesture(GestureType.onForcePressPeak, tapDetail));
          },
          onForcePressUpdate: (tapDetail) {
            print('onForcePressUpdate');
            touchController.add(Gesture(GestureType.onForcePressUpdate, tapDetail));
          },
//           onPanStart: (tapDetail) {
//             touchController.add(Gesture(GestureType.onPanStart, tapDetail));
//           },
//           onPanUpdate: (tapDetail) {
//             touchController.add(Gesture(GestureType.onPanUpdate, tapDetail));
//           },
//           onPanDown: (tapDetail) {
//             touchController.add(Gesture(GestureType.onPanDown, tapDetail));
//           },
          onSecondaryTapDown: (tapDetail) {
            print('onSecondaryTapDown');
            touchController.add(Gesture(GestureType.onSecondaryTapDown, tapDetail));
          },
          onSecondaryTapUp: (tapDetail) {
            print('onSecondaryTapUp');
            touchController.add(Gesture(GestureType.onSecondaryTapUp, tapDetail));
          },
        ));
  }

  @override
  void dispose() {
    touchController.close();
    super.dispose();
  }
}

class TouchDetectionController extends InheritedWidget {
  final StreamController<Gesture> _controller;
  final Function addListener;

  bool get hasListener => _controller.hasListener;

  StreamController<Gesture> get controller => _controller;

  const TouchDetectionController(this._controller, this.addListener, {required Widget child}) : super(child: child);

  static TouchDetectionController? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<TouchDetectionController>();

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return false;
  }
}
