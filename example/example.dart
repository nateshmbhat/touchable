import 'package:flutter/material.dart';
import 'package:touchable/touchable.dart';

class MyExampleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).nextFocus() ;
    return Flexible(
      child: FractionallySizedBox(
          widthFactor: 1,
          heightFactor: 1,
          child: CanvasTouchDetector(
            builder: (context) {
              return CustomPaint(
                painter: MyPainter(context),
              );
            },
          )),
    );
  }
}

class MyPainter extends CustomPainter {
  final BuildContext context;
  MyPainter(this.context); // context from CanvasTouchDetector

  @override
  void paint(Canvas canvas, Size size) {
    var myCanvas = TouchyCanvas(context, canvas);

    myCanvas.drawCircle(Offset(10, 10), 60, Paint()..color = Colors.orange,
        onTapDown: (tapdetail) {
      print('orange Circle touched');
    }, onPanDown: (tapdetail) {
      print('orange circle swiped');
    });

    myCanvas.drawLine(
        Offset(0, 0),
        Offset(size.width - 100, size.height - 100),
        Paint()
          ..color = Colors.black
          ..strokeWidth = 50, onPanUpdate: (detail) {
      print(
          'Black line Swiped'); //do cooler things here. Probably change app state or animate
    });
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
