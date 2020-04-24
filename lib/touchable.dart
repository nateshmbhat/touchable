///Touchable is flutter library to add various gesture callbacks to each Shape you draw on your canvas in your CustomPainter
///
///When using touchable , the only two classes that you would need to use are : [TouchyCanvas] and [CanvasTouchDetector]
///
///## Usage :
///
///Just Wrap your [CustomPaint] widget with [CanvasTouchDetector]. It takes a builder function as argument that expects your [CustomPaint] widget as shown below.
///#### Example :
///
/// ```
///CanvasTouchDetector(
///    builder: (context) =>
///        CustomPaint(
///            painter: MyPainter(context)
///        )
///)
///```
///
///Inside your [CustomPainter] class's [paint] method , create and use the [TouchyCanvas] object (using the context obtained from the [CanvasTouchDetector] and canvas) to draw any shape with different gesture callbacks.
///####Example :
///
/// ```
///var myCanvas = TouchyCanvas(context,canvas);
///myCanvas.drawRect( rect , Paint() , onTapDown: (tapDetail){
///    //Do stuff here. Probably change your state and animate
///});
///```
///
library touchable;

export 'src/canvas_touch_detector.dart';
export 'src/touchy_canvas.dart';
export 'src/types/types.dart';
