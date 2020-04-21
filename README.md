# touchable 👆🏻 

[![](https://img.shields.io/pub/v/touchable)]()
[![](https://img.shields.io/badge/package-flutter-blue)]()
[![](https://img.shields.io/github/license/nateshmbhat/touchable)]()
[![](https://img.shields.io/github/stars/nateshmbhat/touchable)]()
[![](https://img.shields.io/github/forks/nateshmbhat/touchable)]()
[![](https://img.shields.io/twitter/url?style=social&url=https%3A%2F%2Fgithub.com%2Fnateshmbhat%2Ftouchable)](https://twitter.com/intent/tweet?text=Wow:&url=https%3A%2F%2Fgithub.com%2Fnateshmbhat%2Ftouchable)
[![](https://img.shields.io/github/languages/code-size/nateshmbhat/touchable)]()
[![](https://img.shields.io/badge/author-nateshmbhat-green.svg)](https://github.com/nateshmbhat)




<p align="center">
<img width="200" src="https://svgshare.com/i/KCn.svg"/>
</p>


#### Flutter library to add various **gesture callbacks** to each **Shape** you draw on your canvas in your CustomPainter
<br />

<p align="center">
<img src="https://i.imgur.com/0Ft9FHJ.gif"/>
&nbsp; &nbsp;
&nbsp; &nbsp;
&nbsp; &nbsp;
<img src="https://i.imgur.com/Un41cTo.gif"/>
</p>



## Why Use **Touchable** ? 
- The CustomPainter lets you **only draw** shapes on the canvas. But most would want to let user interact with the drawings.

- With touchable , you get what the normal canvas always missed : **touchability** 😉
- With this , its possible to add all kinds of **gesture callbacks to each drawing** and thus interaction capability to each Shape you draw on the canvas.
- Animating individual shapes becomes so much easier  than ever before.
- Handles the painting style of your drawing. So , when your paint is `filled ▮` it registers touch on the entire shape else when its `stroke ▯` , it looks for gesture only on the borders.
- Takes the painting **stroke width** also into account. So if your shapes are painted thick , we still got it covered ✓

- Handles **clipping** and different **clipping modes**. So, You can have any kind of complex clipping and drawing combinations while getting full interactive capability.
- Simple and Easy API. Just wrap your `CustomPaint` with `CanvasTouchDetector` and use the `TouchCanvas` in your painter.


---

## Usage :

- Just Wrap your `CustomPaint` widget with `CanvasTouchDetector`. It takes a `builder` function as argument that expects your `CustomPaint` widget as shown below.

```dart
CanvasTouchDetector(
    builder: (context) => 
        CustomPaint(
            painter: MyPainter(context)
        )
)
```
+ Inside your `CustomPainter` class's `paint` method , create and use the `TouchyCanvas` object (using the `context` obtained from the CanvasTouchDetector and `canvas`) to draw any shape with different gesture callbacks.

```dart
var myCanvas = TouchyCanvas(context,canvas);
myCanvas.drawRect( rect , Paint() , onTapDown: (tapDetail){
    //Do stuff here. Probably change your state and animate
});
```

### MyPainter example :

```dart
class MyPainter extends CustomPainter {

  final BuildContext context ;
  MyPainter(this.context); // context from CanvasTouchDetector

  @override
  void paint(Canvas canvas, Size size) {
    var myCanvas = TouchyCanvas(context,canvas); 

    myCanvas.drawCircle(Offset(10, 10), 60, Paint()..color=Colors.orange ,
        onTapDown: (tapdetail) {
         print("orange Circle touched");
       },
        onPanDown:(tapdetail){
          print("orange circle swiped");
        } 
    );

    myCanvas.drawLine(
        Offset(0, 0),
        Offset(size.width - 100, size.height - 100),
        Paint()
          ..color = Colors.black
          ..strokeWidth = 50, 
        onPanUpdate: (detail) {
            print('Black line Swiped'); //do cooler things here. Probably change app state or animate
    });
  }
}
```

---
<br />

## How Touchable Works : 
When you draw shapes on the canvas (`TouchyCanvas`) , it keeps track of the dimensions of each shape you draw and their painting style , stroke etc. 

When user performs any gesture on the screen , based on the location of the gesture , the appropriate shape is selected from the lot taking clipping regions , paint , hitTest behaviour etc into account in an optimized way. Callbacks of the corresponding shapes (one or more depending on the hitTest behavior) are executed.


## Road Map
- [x] Basic Shape Detection
  - [x] Line
  - [x] Rectangle (Rect)
  - [x] Circle 
  - [x] Oval or Ellipse
  - [x] Arc
    - [x] segment
    - [x] sector 
  - [x] Rounded Rectangle (RRect)
  - [x] Custom Path [only supports opaque hittest]
  - [x] Points
    - [x] PointMode.point
    - [x] PointMode.lines
    - [x] PointMode.polygon
  - [] Vertices
    - [] Traingle
    - [] Traingle Strip
    - [] Traingle Fan
- [x] Support for proper edge detection based on the Paint object properties :
  - [x] Paint style
  - [x] Stroke Width
  - [] Stroke Cap
    - [x] StrokeCap to draw Points
    - [] StrokeCap for lines with large width
- [x] Support Clipping and clipping modes
  - [x] ClipRect
    - [x] intersect mode [Touch detection enabled only inside the clipped region]
    - [x] difference mode [Touch detection enabled only outside the clipped region]
  - [x] ClipRRect
  - [x] ClipPath
- [] Allow customizing touch detection behaviour regardless of the Paint applied (give a HitTestBehavior functionality)
- [] Support for translation , rotation , scaling and skewing transformations that needs some work  vector math