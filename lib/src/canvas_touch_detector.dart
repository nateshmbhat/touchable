import 'dart:async';

import 'package:flutter/material.dart';
import 'package:touchable/src/types/types.dart';

///[CanvasTouchDetector] widget detects the gestures on your [CustomPaint] widget.
///
/// Wrap your [CustomPaint] widget with [CanvasTouchDetector]
/// The [builder] function passes the [BuildContext] and expects a [CustomPaint] object as its return value.
/// The [gesturesToOverride] list must contains list of gestures you want to listen to (by default contains all types of gestures).
class CanvasTouchDetector extends StatefulWidget {
  final CustomTouchPaintBuilder builder;
  final List<GestureType> gesturesToOverride;

  const CanvasTouchDetector({
    Key? key,
    required this.builder,
    this.gesturesToOverride = GestureType.values,
  }) : super(key: key);

  @override
  _CanvasTouchDetectorState createState() => _CanvasTouchDetectorState();
}

class _CanvasTouchDetectorState extends State<CanvasTouchDetector> {
  final StreamController<Gesture> touchController =
      StreamController.broadcast();
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
              return MouseRegion(
                hitTestBehavior: HitTestBehavior.translucent,
                onEnter: !widget.gesturesToOverride
                        .contains(GestureType.onEnter)
                    ? null
                    : (mouseEnterDetail) {
                        touchController.add(Gesture(
                            GestureType.onEnter, mouseEnterDetail.original));
                      },
                onExit: !widget.gesturesToOverride.contains(GestureType.onExit)
                    ? null
                    : (mouseExitDetail) {
                        touchController.add(Gesture(
                            GestureType.onExit, mouseExitDetail.original));
                      },
                onHover: !widget.gesturesToOverride
                        .contains(GestureType.onHover)
                    ? null
                    : (mouseHoverDetail) {
                        touchController.add(Gesture(
                            GestureType.onHover, mouseHoverDetail.original));
                      },
                child: widget.builder(context),
              );
            },
          ),
          onTapDown: !widget.gesturesToOverride.contains(GestureType.onTapDown)
              ? null
              : (tapDetail) {
                  touchController
                      .add(Gesture(GestureType.onTapDown, tapDetail));
                },
          onTapUp: !widget.gesturesToOverride.contains(GestureType.onTapUp)
              ? null
              : (tapDetail) {
                  touchController.add(Gesture(GestureType.onTapUp, tapDetail));
                },
          onHorizontalDragDown: !widget.gesturesToOverride
                  .contains(GestureType.onHorizontalDragDown)
              ? null
              : (tapDetail) {
                  touchController.add(
                      Gesture(GestureType.onHorizontalDragDown, tapDetail));
                },
          onHorizontalDragStart: !widget.gesturesToOverride
                  .contains(GestureType.onHorizontalDragStart)
              ? null
              : (tapDetail) {
                  touchController.add(
                      Gesture(GestureType.onHorizontalDragStart, tapDetail));
                },
          onHorizontalDragUpdate: !widget.gesturesToOverride
                  .contains(GestureType.onHorizontalDragUpdate)
              ? null
              : (tapDetail) {
                  touchController.add(
                      Gesture(GestureType.onHorizontalDragUpdate, tapDetail));
                },
          onVerticalDragDown: !widget.gesturesToOverride
                  .contains(GestureType.onVerticalDragDown)
              ? null
              : (tapDetail) {
                  touchController
                      .add(Gesture(GestureType.onVerticalDragDown, tapDetail));
                },
          onVerticalDragStart: !widget.gesturesToOverride
                  .contains(GestureType.onVerticalDragStart)
              ? null
              : (tapDetail) {
                  touchController
                      .add(Gesture(GestureType.onVerticalDragStart, tapDetail));
                },
          onVerticalDragUpdate: !widget.gesturesToOverride
                  .contains(GestureType.onVerticalDragUpdate)
              ? null
              : (tapDetail) {
                  touchController.add(
                      Gesture(GestureType.onVerticalDragUpdate, tapDetail));
                },
          onLongPressStart: !widget.gesturesToOverride
                  .contains(GestureType.onLongPressStart)
              ? null
              : (tapDetail) {
                  touchController
                      .add(Gesture(GestureType.onLongPressStart, tapDetail));
                },
          onLongPressEnd:
              !widget.gesturesToOverride.contains(GestureType.onLongPressEnd)
                  ? null
                  : (tapDetail) {
                      touchController
                          .add(Gesture(GestureType.onLongPressEnd, tapDetail));
                    },
          onLongPressMoveUpdate: !widget.gesturesToOverride
                  .contains(GestureType.onLongPressMoveUpdate)
              ? null
              : (tapDetail) {
                  touchController.add(
                      Gesture(GestureType.onLongPressMoveUpdate, tapDetail));
                },
          onScaleStart:
              !widget.gesturesToOverride.contains(GestureType.onScaleStart)
                  ? null
                  : (tapDetail) {
                      touchController
                          .add(Gesture(GestureType.onScaleStart, tapDetail));
                    },
          onScaleUpdate:
              !widget.gesturesToOverride.contains(GestureType.onScaleUpdate)
                  ? null
                  : (tapDetail) {
                      touchController
                          .add(Gesture(GestureType.onScaleUpdate, tapDetail));
                    },
          onForcePressStart: !widget.gesturesToOverride
                  .contains(GestureType.onForcePressStart)
              ? null
              : (tapDetail) {
                  touchController
                      .add(Gesture(GestureType.onForcePressStart, tapDetail));
                },
          onForcePressEnd:
              !widget.gesturesToOverride.contains(GestureType.onForcePressEnd)
                  ? null
                  : (tapDetail) {
                      touchController
                          .add(Gesture(GestureType.onForcePressEnd, tapDetail));
                    },
          onForcePressPeak: !widget.gesturesToOverride
                  .contains(GestureType.onForcePressPeak)
              ? null
              : (tapDetail) {
                  touchController
                      .add(Gesture(GestureType.onForcePressPeak, tapDetail));
                },
          onForcePressUpdate: !widget.gesturesToOverride
                  .contains(GestureType.onForcePressUpdate)
              ? null
              : (tapDetail) {
                  touchController
                      .add(Gesture(GestureType.onForcePressUpdate, tapDetail));
                },
          onPanStart:
              !widget.gesturesToOverride.contains(GestureType.onPanStart)
                  ? null
                  : (tapDetail) {
                      touchController
                          .add(Gesture(GestureType.onPanStart, tapDetail));
                    },
          onPanUpdate:
              !widget.gesturesToOverride.contains(GestureType.onPanUpdate)
                  ? null
                  : (tapDetail) {
                      touchController
                          .add(Gesture(GestureType.onPanUpdate, tapDetail));
                    },
          onPanDown: !widget.gesturesToOverride.contains(GestureType.onPanDown)
              ? null
              : (tapDetail) {
                  touchController
                      .add(Gesture(GestureType.onPanDown, tapDetail));
                },
          onSecondaryTapDown: !widget.gesturesToOverride
                  .contains(GestureType.onSecondaryTapDown)
              ? null
              : (tapDetail) {
                  touchController
                      .add(Gesture(GestureType.onSecondaryTapDown, tapDetail));
                },
          onSecondaryTapUp: !widget.gesturesToOverride
                  .contains(GestureType.onSecondaryTapUp)
              ? null
              : (tapDetail) {
                  touchController
                      .add(Gesture(GestureType.onSecondaryTapUp, tapDetail));
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

  const TouchDetectionController(this._controller, this.addListener,
      {required Widget child})
      : super(child: child);

  static TouchDetectionController? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<TouchDetectionController>();

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return false;
  }
}
