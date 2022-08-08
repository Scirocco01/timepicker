import 'dart:async';
import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ClockView extends StatefulWidget {
  const ClockView({Key? key}) : super(key: key);

  @override
  State<ClockView> createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  var xvalue = 20.0;
  var yValue = 20.0;
  @override
  void initState() {
    // Timer.periodic(Duration(seconds: 5), (timer) {
    //   setState(() {});
    // });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, '/');
        },
        child: Text('back'),
      ),
      body: Center(
        child: Container(

          width: 400,
          height: 400,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Listener(
                onPointerDown: (PointerDownEvent event) {
                  // Global screen position.
                  print("Global position x:${event.position.dx}, y:${event.position.dy}");
                  setState((){
                    xvalue = event.position.dx;
                    yValue = event.position.dy;
                  });
                  // Position relative to where this widget starts.
                  print("Relative position: x:${event.localPosition.dx}, y:${event.localPosition.dy}");
                },
                child: Transform.rotate(
                  angle: -pi / 2,
                    child: CustomPaint(
                      painter: ClockPainter(xvalue: xvalue, yvalue: yValue),
              ),
            )),
          ),
        ),
      ),
    );
  }
}

// MouseRegion(
// onEnter: (PointerEnterEvent event){
// print('x: ${event.position.dx}, y: ${event.position.dy}');
// xvalue = event.position.dx ;
// yValue = event.position.dy ;
// },

// MouseRegion(
// onEnter: (PointerEnterEvent event) {
// print('x: ${event.position.dx}, y: ${event.position.dy}');
// },
// onHover: (PointerHoverEvent event) {
// print('x: ${event.position.dx}, y: ${event.position.dy}');
// },
// onExit: (PointerExitEvent event) {
// print('x: ${event.position.dx}, y: ${event.position.dy}');
// },
// child: child,
// )

class ClockPainter extends CustomPainter {
  var xvalue;

  var yvalue;

  ClockPainter({required this.xvalue, required this.yvalue});

  var dateTime = DateTime.now();

  var adder = 0;

  timepickFunc(){

    if((xvalue > 625.0 && xvalue <655.0 ) || ( yvalue == 653.0)) return 0;

    if((xvalue > 712.0 && xvalue <748.0 ) || ( yvalue == 163.0)) return 1;

    if((xvalue > 795.0 && xvalue <820.0 ) && ( yvalue >230.0 && yvalue <270)) return 2;
    if((xvalue > 827.0 && xvalue <655.0 ) || ( yvalue == 653.0)) return 0;
    if((xvalue > 625.0 && xvalue <655.0 ) || ( yvalue == 653.0)) return 0;
    else{
      return 6;
    }

  }



  @override

  void paint(Canvas canvas, Size size) {
    var value = timepickFunc();
   print(timepickFunc().toString());
    var centerx = size.width / 2;
    var centery = size.height / 2;
    var center = Offset(centerx, centery);
    var radius = min(centerx, centery);

    var fillbrush = Paint()..color = Color(0xFF444974);

    var outlinebrush = Paint()
      ..color = Color(0xFFEAECFF)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20;

    var centerbrush = Paint()..color = Color(0xFFEAECFF);

    var secHandBrush = Paint()
      ..color = Color(0xFFFF8A65)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 16
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius - 60, fillbrush);
    canvas.drawCircle(center, radius - 50, outlinebrush);

    var secHandX = centerx + 150 * cos(value * 30 * pi / 180);
    var secHandY = centery + 150 * sin(value * 30 * pi / 180);
    // print('x = ${dateTime.second} , y = ${dateTime.second}');
    // print('x = ${secHandX + 300} , y = ${secHandY+300}');
    // print( 'center x = $centerx , center y  = $centery');

    canvas.drawLine(center, Offset(secHandX, secHandY), secHandBrush);

    canvas.drawCircle(center, 30, centerbrush);

    var outerCircleRadius = radius;
    var innerCircleRadius = radius - 14;
    for(double i = 0; i<360;  i +=30){
      var x1 = centerx + outerCircleRadius * cos( i * pi/180);
      var y1 = centery + outerCircleRadius * sin( i * pi / 180);

      var x2 = centerx + innerCircleRadius * cos( i * pi/180);
      var y2 = centery + innerCircleRadius * sin( i * pi / 180);
     canvas.drawLine(Offset(x1, y1), Offset(x2, y2), secHandBrush);
     const Text('alpha',style: TextStyle(color: Colors.black,fontSize: 15),);


    }


  }


  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
