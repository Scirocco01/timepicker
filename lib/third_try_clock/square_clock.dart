import 'dart:async';

import 'package:flutter/material.dart';

import 'needle_pianter.dart';

class SquareClock extends StatefulWidget {
  const SquareClock({Key? key}) : super(key: key);

  @override
  State<SquareClock> createState() => _SquareClockState();
}

class _SquareClockState extends State<SquareClock> {

  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {}
      );
    });

    super.initState();
  }
  var lXvalue = 197.3333333;
  var lyvalue =43.3333 ;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text('back'),
      ),
      body: Center(
        child: Container(
          height: 400,
          width: 400,
          child: Stack(
            children: [
              Listener(
                  onPointerDown: (PointerDownEvent event) {
                    setState(() {
                      lXvalue = event.localPosition.dx;
                      lyvalue = event.localPosition.dy;
                    });
                    print(
                        "Global 12 position x:${event.position.dx}, y:${event.position.dy}");
                    print(
                        "Relative  12 position: x:${event.localPosition.dx}, y:${event.localPosition.dy}");
                  },
                  child: Dials(
                    txt: '12',
                    x: 0.0,
                    y: -0.84,
                  )),

              Listener(
                  onPointerDown: (PointerDownEvent event) {
                    setState(() {
                      lXvalue = event.localPosition.dx;
                      lyvalue = event.localPosition.dy;
                    });
                    print(
                        "Global position x:${event.position.dx}, y:${event.position.dy}");
                    print(
                        "Relative position: x:${event.localPosition.dx}, y:${event.localPosition.dy}");
                  },
                  child: Dials(
                    txt: '1',
                    x: 0.38,
                    y: -0.74,
                  )),

              Align(alignment: const Alignment(0.671, -0.48,),
                child: Listener(

                  onPointerDown: (PointerDownEvent event) {
                    setState(() {
                      lXvalue = event.localPosition.dx;
                      lyvalue = event.localPosition.dy;
                    });
                    print(
                        "Global 2 position x:${event.position.dx}, y:${event.position.dy}");
                    print(
                        "Relative 2 position: x:${event.localPosition.dx}, y:${event.localPosition.dy}");
                  },
                  child: Container(
                    child: const Text(
                      '2',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),

              // Dials(
              //   txt: '2',
              //   x: 0.671,
              //   y: -0.48,
              // ),

              const Dials(
                txt: '3',
                x: 0.78,
                y: -0.0,
              ),

              const Dials(
                txt: '4',
                x: 0.671,
                y: 0.48,
              ),

              const Dials(
                txt: '5',
                x: 0.38,
                y: 0.74,
              ),

              const Dials(
                txt: '6',
                x: 0.0,
                y: 0.84,
              ),

              Dials(
                txt: '7',
                x: -0.38,
                y: 0.74,
              ),

              Dials(
                txt: '8',
                x: -0.671,
                y: 0.48,
              ),

              Dials(
                txt: '9',
                x: -0.78,
                y: -0.0,
              ),

              Dials(
                txt: '10',
                x: -0.671,
                y: -0.48,
              ),

              Dials(
                txt: '1',
                x: -0.38,
                y: -0.74,
              ),
              Center(
                  child: Container(
                      height: 280,
                      width: 280,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(150),
                      ),
                      child: Stack(children: [
                        Container(
                          width: 300,
                          height: 300,
                          padding: const EdgeInsets.all(10.0),
                          child: CustomPaint(
                            painter: Needle(xvalue: lXvalue, yvalue: lyvalue),
                          ),
                        ),
                        Center(
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Colors.lightBlueAccent,
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                        ),
                      ]))),
              // Center Circle
            ],
          ),
        ),
      ),
    );
  }
}

class Dials extends StatefulWidget {
  const Dials({
    Key? key,
    required this.txt,
    this.x,
    this.y,
  }) : super(key: key);
  final txt;
  final x;
  final y;

  @override
  State<Dials> createState() => _DialsState();
}

class _DialsState extends State<Dials> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(widget.x, widget.y),
      child: Clock_dials(
        text: widget.txt,
      ),
    );
  }
}

class Clock_dials extends StatefulWidget {
  const Clock_dials({
    Key? key,
    this.text,
  }) : super(key: key);
  final text;

  @override
  State<Clock_dials> createState() => _Clock_dialsState();
}

class _Clock_dialsState extends State<Clock_dials> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        widget.text,
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}

class Needle extends CustomPainter {
  final xvalue;
  final yvalue;

  Needle({this.xvalue, this.yvalue});

  @override
  void paint(Canvas canvas, Size size) {
    var centerx = size.width / 2;
    var centery = size.height / 2;
    var center = Offset(centerx, centery);

    var secHandBrush = Paint()
      ..color = Color(0xFFFF8A65)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 16
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(center, Offset(xvalue, yvalue), secHandBrush);
    print('this is x value $xvalue , this is y value $yvalue');
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
