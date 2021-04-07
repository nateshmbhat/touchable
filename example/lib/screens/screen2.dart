import 'dart:math';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:touchable/touchable.dart';

class Screen2 extends StatefulWidget {
  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> with TickerProviderStateMixin {
  AnimationController smile;
  AnimationController eye;
  AnimationController nose;

  @override
  void initState() {
    smile = AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    eye = AnimationController(duration: Duration(seconds: 1), vsync: this);
    nose = AnimationController(duration: Duration(milliseconds: 300), vsync: this);
    nose.addListener(() {
      setState(() {});
    });
    eye.addListener(() {
      setState(() {});
    });
    smile.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Flexible(
            child: FractionallySizedBox(
              widthFactor: 1,
              heightFactor: 1,
              child: Container(
                  color: Colors.white,
                  child: CanvasTouchDetector(
                    builder: (context) {
                      return CustomPaint(
                        painter: MyPainter(context, smile, eye, nose),
                      );
                    },
                  )),
            ),
          ),
        ],
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  final BuildContext context;

  AnimationController smileAnimationController;
  AnimationController eyeAnimationController;
  AnimationController noseAnimationController;

  MyPainter(this.context, this.smileAnimationController, this.eyeAnimationController, this.noseAnimationController);

  @override
  void paint(Canvas _canvas, Size size) {
    print(size);
    TouchyCanvas canvas = TouchyCanvas(context, _canvas);
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 150, Paint()..color = Colors.yellow);
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 150, Paint()..style = PaintingStyle.stroke);
    drawSmile(canvas, size);
    drawEyes(canvas, size);
    drawNose(canvas, size);
  }

  void drawSmile(TouchyCanvas canvas, Size size) {
    var center = Offset(size.width / 2, size.height / 2);
    var smileCenter = Offset(center.dx, center.dy + 75);
    var smileAnimation = Tween<double>(begin: 0, end: 90)
        .animate(CurvedAnimation(parent: smileAnimationController, curve: Curves.fastOutSlowIn));
    canvas.drawLine(
        Offset(center.dx - 80, smileCenter.dy),
        Offset(center.dx + 80, smileCenter.dy),
        Paint()
          ..strokeWidth = 15
          ..color = Colors.black, onTapDown: (_) {
      smileAnimationController.reverse();
    });

    canvas.drawArc(Rect.fromCenter(center: smileCenter, width: 160, height: smileAnimation.value), 0, pi, false,
        Paint()..color = Colors.black, onTapDown: (detail) {
      print("clicked");
      if (smileAnimation.value == 90) {
        smileAnimationController.reverse();
      }
    });
  }

  void drawNose(TouchyCanvas canvas, Size size) {
    var center = Offset(size.width / 2, size.height / 2);
    var noseColor = ColorTween(begin: Colors.blueGrey, end: Colors.lightBlueAccent)
        .animate(CurvedAnimation(parent: noseAnimationController, curve: Curves.bounceOut));
    var noseLength = Tween<double>(begin: 0, end: 100).animate(noseAnimationController);
    var upperbound = noseAnimationController.upperBound;

    void drawNose(Color color, double extraLength) {
      canvas.drawPath(
          Path()
            ..addPolygon([
              Offset(center.dx, center.dy - 10),
              Offset(center.dx - 15, center.dy + 25 + extraLength),
              Offset(center.dx + 15, center.dy + 25 + extraLength)
            ], true),
          Paint()..color = color, onTapDown: (_) {
        print("On Pan Down");
        if (noseAnimationController.value == upperbound || noseAnimationController.status == AnimationStatus.forward) {
          noseAnimationController.reverse();
        } else
          noseAnimationController.forward();
      });
    }

    drawNose(noseColor.value, noseLength.value);
    drawNose(Colors.black, 0);
  }

  void drawEyes(TouchyCanvas canvas, Size size) {
    var center = Offset(size.width / 2, size.height / 2);
    var eyeAnimation = Tween<double>(begin: 0, end: 50)
        .animate(CurvedAnimation(parent: eyeAnimationController, curve: Curves.easeOut));

    void drawEye(double xOffset) {
      canvas.drawCircle(
          Offset(center.dx + xOffset, center.dy - 50),
          20,
          Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = 2);
      canvas.drawCircle(Offset(center.dx - xOffset, center.dy - 40), 10, Paint());
      canvas.drawCircle(Offset(center.dx + xOffset, center.dy - 50), 20, Paint()..color = Colors.transparent,
          onTapDown: (_) {
        eyeAnimationController.reverse();
      });
    }

    void drawEyeLid(double xOffset) {
      canvas.drawCircle(
          Offset(center.dx + xOffset, center.dy - 50 - eyeAnimation.value),
          18,
          Paint()
            ..style = PaintingStyle.fill
            ..color = Colors.yellow, onTapDown: (_) {
        eyeAnimationController.forward();
      });
    }

    drawEye(-50); //left
    drawEye(50); //right
    drawEyeLid(-50); // left
    drawEyeLid(50); //right
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
