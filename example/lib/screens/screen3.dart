import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:touchable/touchable.dart';

class Screen3 extends StatefulWidget {
  @override
  _Screen3State createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> with SingleTickerProviderStateMixin {
  Color color = Colors.orange;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Flexible(
            child: AnimatedContainer(
                duration: Duration(seconds: 1),
                color: color,
                width: 400,
                height: 900,
                child: CanvasTouchDetector(
                  builder: (context) {
                    return CustomPaint(
                      painter: MyPainter(context, (String circleColor) {
                        setState(() {
                          switch (circleColor) {
                            case 'orange':
                              color = Colors.orange;
                              break;
                            case 'pink':
                              color = Colors.pinkAccent;
                              break;
                            case 'green':
                              color = Colors.green;
                              break;
                            case 'black':
                              color = Colors.black;
                              break;
                            case 'purple':
                              color = Colors.purple;
                              break;
                            case 'grey':
                              color = Colors.grey;
                              break;
                            default:
                              color = Colors.blue;
                          }
                        });
                      }),
                    );
                  },
                )),
          ),
        ],
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  Function(String) setState;
  final BuildContext context;

  MyPainter(this.context, this.setState);

  @override
  void paint(Canvas _canvas, Size size) {
    TouchyCanvas canvas = TouchyCanvas(context, _canvas);

    canvas.drawRect(Rect.fromLTWH(0, 0, 100, 300), Paint()..color = Colors.blue, onTapDown: (_) {
      setState('blue');
    });
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
